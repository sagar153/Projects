USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spGetCompanyDetailsByVariety]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <spGetCompanyDetailsByVariety>  
-- =============================================  
CREATE PROCEDURE [dbo].[spGetCompanyDetailsByVariety]   
    -- Add the parameters for the stored procedure here
	@Year varchar(50),  
	@CompanyId int,
	@Variety nvarchar(100)  
    --================================================   
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;        
   
	Declare @StartDate Datetime
	Declare @EndDate Datetime
	Declare @Hours int
	Declare @Lot int
	Declare @LastMoist decimal(18,2)
	select top 1 @StartDate = Date from [dbo].[BinMoist] 
	WHERE [Year] = @Year AND isActive = 1 AND CompanyId = @CompanyId  AND Variety = @Variety Order by BinDailyMoistId
	
	select top 1 @EndDate = ShellingDate, @Lot = Lot, @LastMoist = EvnUpmoist from [dbo].[BinMoist] 
	WHERE [Year] = @Year AND isActive = 1 AND CompanyId = @CompanyId  AND Variety = @Variety
	AND Shelling = 1 
	Order by BinDailyMoistId

	select @Hours = DATEDIFF(HH,@StartDate,@EndDate)

	SELECT 
	C.CompanyName,
    FI.Date,
	FI.LorryNo,
	FI.Variety,
	FI.Weight,
	FI.Moist,
	B.BinName, 
	@EndDate AS ShellingDate,
	@LastMoist AS ShellingMoist,
	FI.Bags, -- Outward
	ISNULL(@Lot,'') Lot,
	ISNULL(@Hours,'') Hrs,
	FI.Executive -- OutWard
	FROM [dbo].[FactoryIntake] FI
	LEFT JOIN [dbo].[Bins] B ON FI.BinId = B.BinId
	LEFT JOIN [dbo].[Companies] C ON FI.CompanyId = C.CompanyId
	WHERE FI.isActive = 1 AND FI.[Year] = @Year AND FI.CompanyId = @CompanyId  AND FI.Variety = @CompanyId
END  