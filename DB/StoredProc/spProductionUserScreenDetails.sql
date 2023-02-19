USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spProductionUserScreenDetails]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <spProductionUserScreenDetails>  
-- =============================================  
CREATE PROCEDURE [dbo].[spProductionUserScreenDetails]   
    -- Add the parameters for the stored procedure here  	
	@Year nvarchar(50),
	@OrganiserId int,  
	@Variety varchar(50),
	@Area varchar(100),
    @OperationType int   
    --================================================  
    --operation types   
    -- 1) Get Varieties
	-- 2) Get Varieties By Id including Aggregation
	-- 3) Farmer Details by Variety and Area
	-- 4) GetAcres
	-- 5) GetFarmersByArea
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        SELECT distinct Variety FROM [dbo].[Production] 
		WHERE [Year] = @Year  AND isActive = 1   
    END 
	IF @OperationType=2  
    BEGIN  
        SELECT P.Area,SUM(ACRES) ACRES,O.OrganiserName FROM [dbo].[Production] P
		LEFT JOIN [dbo].[Organiser] O ON P.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND P.isActive = 1 AND Variety = @Variety
		Group By P.Area,O.OrganiserName
    END 
	IF @OperationType=3  
    BEGIN  
        SELECT OrganiserName,FarmerName,P.FatherName,ACRES,P.Village,P.Mobile,ShowingDate,HarvestDate,TotalTonnage FROM [dbo].[Production] P
		LEFT JOIN [dbo].[Organiser] O ON P.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND P.isActive = 1 AND Variety = @Variety AND P.Area = @Area
    END 
	IF @OperationType=4
    BEGIN  
        SELECT P.Area,SUM(ACRES) ACRES FROM [dbo].[Production] P
		LEFT JOIN [dbo].[Organiser] O ON P.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND P.isActive = 1
		Group By P.Area
    END 
	IF @OperationType=5  
    BEGIN  
        SELECT OrganiserName,FarmerName,P.FatherName,ACRES,P.Village,P.Mobile,ShowingDate,HarvestDate,TotalTonnage FROM [dbo].[Production] P
		LEFT JOIN [dbo].[Organiser] O ON P.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND P.isActive = 1 AND P.Area = @Area
    END 
       
END  