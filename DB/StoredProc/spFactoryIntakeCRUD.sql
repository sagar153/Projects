USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spFactoryIntakeCRUD]  
GO
-- =============================================  
-- Author:      <Sagar>   
-- Description: <Perform crud operation on Bin table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spFactoryIntakeCRUD]   
    -- Add the parameters for the stored procedure here  
	@FactoryIntakeId int,
	@CompanyId int,
	@Year varchar(50),
	@Date DateTime,
	@LorryNo varchar(50),
	@Variety varchar(50),
	@Weight decimal(18,2),
	@Moist decimal(18,2),
	@Bags int,
	@Lot int,
	@Executive varchar(100),
	@BinId int,
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
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[FactoryIntake]
           (CompanyId, [Year], [Date], LorryNo, Variety, [Weight], Moist, Bags, Lot, Executive, BinId, Remarks, isActive, DateAdded, DateModified)
     VALUES
           (@CompanyId, @Year, @Date, @LorryNo, @Variety, @Weight, @Moist, @Bags, @Lot, @Executive, @BinId, @Remarks, @isActive, GETDATE(), GETDATE())
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[FactoryIntake] SET
            CompanyId = @CompanyId,
			[Year] = @Year,
			[Date] = @Date,
			LorryNo = @LorryNo,
			Variety = @Variety,
			[Weight] = @Weight,
			Moist = @Moist,
			Bags = @Bags, 
			Lot = @Lot,
			Executive = @Executive,
			BinId = @BinId,
			Remarks = @Remarks,
			isActive = @isActive,
			DateModified = GETDATE()
		   WHERE FactoryIntakeId = @FactoryIntakeId  
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[FactoryIntake] SET isActive = 0 WHERE FactoryIntakeId = @FactoryIntakeId  
    END 
    ELSE IF @OperationType = 4  
    BEGIN  
        SELECT B.BinName, C.CompanyName, FI.* FROM [dbo].[FactoryIntake] FI
		LEFT JOIN [dbo].[Bins] B ON FI.BinId = B.BinId
		LEFT JOIN [dbo].[Companies] C ON FI.CompanyId = C.CompanyId
		WHERE FI.isActive = 1 AND [Year] = @Year
    END  
	ELSE
	BEGIN  

        SELECT B.BinName, C.CompanyName, FI.* FROM [dbo].[FactoryIntake] FI
		 JOIN [dbo].[Bins] B ON FI.BinId = B.BinId
		 JOIN [dbo].[Companies] C ON FI.CompanyId = C.CompanyId		
    END 
       
END  