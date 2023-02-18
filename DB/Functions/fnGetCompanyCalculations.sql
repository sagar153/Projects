USE FactoryManagement
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP FUNCTION IF EXISTS [dbo].[fnGetCompanyCalculations]  
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SELECT * FROM fnGetCompanyCalculations(1,'2022-23','MY-35')
CREATE FUNCTION fnGetCompanyCalculations
(
	-- Add the parameters for the function here
	@CompanyId int,
	@Year varchar(50),
	@Variety varchar(100)
)
RETURNS @CompanyDetails TABLE (
	EndDate Datetime,
	StartDate Datetime,
	Hours int,
	Lot int,
	LastMoist decimal(18,2),
	InMoist decimal(18,2)
	)
AS
BEGIN
	
	Declare @StartDate Datetime
	Declare @EndDate Datetime
	Declare @Hours int
	Declare @Lot int
	Declare @LastMoist decimal(18,2)
	Declare @InMoist decimal(18,2)

	select top 1 @InMoist = MorningDownMoist ,@StartDate = Date from [dbo].[BinMoist] 
	WHERE [Year] = @Year AND isActive = 1 AND CompanyId = @CompanyId  AND Variety = @Variety Order by BinDailyMoistId
	
	select top 1 @EndDate = ShellingDate, @Lot = Lot, @LastMoist = EvnUpmoist from [dbo].[BinMoist] 
	WHERE [Year] = @Year AND isActive = 1 AND CompanyId = @CompanyId  AND Variety = @Variety
	AND Shelling = 1 
	Order by BinDailyMoistId

	select @Hours = DATEDIFF(HH,@StartDate,@EndDate)
	INSERT INTO @CompanyDetails VALUES(@StartDate,@EndDate,@Hours,@Lot,@LastMoist,@InMoist);
	RETURN 
END
GO