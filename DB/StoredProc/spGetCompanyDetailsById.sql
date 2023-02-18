USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spGetCompanyDetailsById]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <spGetCompanyDetailsByVariety>  
-- =============================================  
--exec spGetCompanyDetailsByVariety '2022-23',1
CREATE PROCEDURE [dbo].[spGetCompanyDetailsById]   
    -- Add the parameters for the stored procedure here
	@Year varchar(50),  
	@CompanyId int 
    --================================================   
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;        

	SELECT 
	C.CompanyName,
    FI.Date,
	FI.LorryNo,
	FI.Variety,
	FI.Weight,
	FI.Moist,
	B.BinName, 
	(SELECT EndDate FROM fnGetCompanyCalculations(FI.CompanyId,FI.Year,FI.Variety)) AS ShellingDate,
	(SELECT LastMoist FROM fnGetCompanyCalculations(FI.CompanyId,FI.Year,FI.Variety)) AS ShellingMoist,
	FI.Bags, -- Outward
	ISNULL((SELECT Lot FROM fnGetCompanyCalculations(FI.CompanyId,FI.Year,FI.Variety)),'') Lot,
	ISNULL((SELECT Hours FROM fnGetCompanyCalculations(FI.CompanyId,FI.Year,FI.Variety)),'') Hrs,
	FI.Executive -- OutWard
	FROM [dbo].[FactoryIntake] FI
	LEFT JOIN [dbo].[Bins] B ON FI.BinId = B.BinId
	LEFT JOIN [dbo].[Companies] C ON FI.CompanyId = C.CompanyId
	WHERE FI.isActive = 1 AND FI.[Year] = @Year AND FI.CompanyId = @CompanyId
END  