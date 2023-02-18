USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spFactoryOutwardCRUD]  
GO
-- =============================================  
-- Author:      <Sagar>   
-- Description: <Get Factory Outtake Data>  
-- =============================================  
CREATE PROCEDURE [dbo].[spFactoryOutwardCRUD]   
    -- Add the parameters for the stored procedure here  
	@FactoryOutwardId int,
	@CompanyId int,
	@Year varchar(50),
	@Date DateTime,
	@LorryNo varchar(50),
	@Variety nvarchar(50),
	@Weight decimal(18,2),
	@Bags int,
	@DCNo int,
	@Executive varchar(100),
	@Remarks varchar(1000),
	@isActive bit,
	@OperationType int
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Select only Active
	-- 5) Select All
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON; 
	
	IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[FactoryOutward]
           (CompanyId, [Year], [Date], LorryNo, Variety, [Weight], Bags, DCNo, CompanyExecutive, Remarks, isActive)
     VALUES
           (@CompanyId, @Year, @Date, @LorryNo, @Variety, @Weight,  @Bags, @DCNo, @Executive, @Remarks, @isActive)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[FactoryOutward] SET
            CompanyId = @CompanyId,
			[Year] = @Year,
			[Date] = @Date,
			LorryNo = @LorryNo,
			Variety = @Variety,
			[Weight] = @Weight,
			Bags = @Bags, 
			DCNo = @DCNo,
			CompanyExecutive = @Executive,
			Remarks = @Remarks,
			isActive = @isActive
		   WHERE FactoryOutWardId = @FactoryOutwardId  
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].FactoryOutward SET isActive = 0 WHERE FactoryOutWardId = @FactoryOutwardId  
    END 
    ELSE IF @OperationType = 4  
    BEGIN  
        SELECT C.CompanyName, FO.* FROM [dbo].FactoryOutward FO
		LEFT JOIN [dbo].[Companies] C ON FO.CompanyId = C.CompanyId
		WHERE FO.isActive = 1 AND [Year] = @Year
    END  
	ELSE
	BEGIN  
        SELECT  C.CompanyName, FO.* FROM [dbo].FactoryOutward FO
		 JOIN [dbo].[Companies] C ON FO.CompanyId = C.CompanyId AND [Year] = @Year
    END 
       
END  