USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spGetShellingDetails]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <spGetShellingDetails>  
-- =============================================  
--exec spGetShellingDetails '2022-23'
CREATE PROCEDURE [dbo].[spGetShellingDetails]   
    -- Add the parameters for the stored procedure here
	@Year varchar(50)
    --================================================   
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;        

	SELECT
	BM.Date,
	B.BinName, 
	C.CompanyName,    
	BM.Variety,
	(SELECT LastMoist FROM fnGetCompanyCalculations(BM.CompanyId,BM.Year,BM.Variety)) AS Moist,
	(SELECT StartDate FROM fnGetCompanyCalculations(BM.CompanyId,BM.Year,BM.Variety)) AS InDate,
	(SELECT InMoist FROM fnGetCompanyCalculations(BM.CompanyId,BM.Year,BM.Variety)) AS InMoist,
	(SELECT top 1 ISNULL(Bags,'') FROM FactoryOutward WHERE CompanyId = BM.CompanyId AND Year = BM.Year AND Variety = BM.Variety AND isActive = 1) AS Bags,
	(SELECT top 1 ISNULL(CompanyExecutive,'') FROM FactoryOutward WHERE CompanyId = BM.CompanyId AND Year = BM.Year AND Variety = BM.Variety AND isActive = 1) AS Executive,
	(SELECT top 1 ISNULL(Remarks,'') FROM FactoryOutward WHERE CompanyId = BM.CompanyId AND Year = BM.Year AND Variety = BM.Variety AND isActive = 1) AS Remarks	
	FROM [dbo].[BinMoist] BM
	LEFT JOIN [dbo].[Bins] B ON BM.BinId = B.BinId
	LEFT JOIN [dbo].[Companies] C ON BM.CompanyId = C.CompanyId
	WHERE BM.isActive = 1 AND BM.[Year] = @Year AND Bm.Shelling = 1 
END  