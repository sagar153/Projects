USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spOrganiserDetails]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <spOrganiserDetails>  
-- =============================================  
CREATE PROCEDURE [dbo].[spOrganiserDetails]   
    -- Add the parameters for the stored procedure here  
	@OrganiserId int,
	@Year varchar(100)	
AS  
BEGIN  

SELECT OrganiserName,
FatherName,
Mobile,
Village,
(SELECT
		STUFF((SELECT DISTINCT  ', ' + CAST(AREA AS VARCHAR(10)) [text()]
         FROM Production 
         WHERE OrganiserId = @OrganiserId AND isActive = 1 AND Year = @Year
         FOR XML PATH(''), TYPE)
        .value('.','NVARCHAR(MAX)'),1,2,' ')) Area,
(SELECT SUM(ACRES) FROM Production WHERE isActive = 1 AND OrganiserId = @OrganiserId AND Year = @Year) Acres,
(SELECT count(*) FROM Production WHERE isActive = 1 AND OrganiserId = @OrganiserId AND Year = @Year) FarmerCount,
(SELECT
		STUFF((SELECT DISTINCT  ', ' + CAST(Variety AS VARCHAR(10)) [text()]
         FROM Production 
         WHERE OrganiserId = @OrganiserId AND isActive = 1 AND Year = @Year
         FOR XML PATH(''), TYPE)
        .value('.','NVARCHAR(MAX)'),1,2,' ')) Varieties,
(SELECT SUM(Advance) FROM OrganiserAdvance WHERE isActive = 1 AND OrganiserId = @OrganiserId AND Year = @Year) Advance,
(SELECT SUM(TotalTonnage) FROM Production WHERE isActive = 1 AND OrganiserId = @OrganiserId AND Year = @Year) TotalTonnage
FROM  [dbo].[Organiser]
WHERE isActive=1 AND OrganiserId = @OrganiserId

END