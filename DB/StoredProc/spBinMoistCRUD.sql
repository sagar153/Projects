USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spBinMoistCRUD]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on production table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spBinMoistCRUD]   
    -- Add the parameters for the stored procedure here  
	@BinMoistId int,
	@BinId int,
	@Date DateTime,
	@Year varchar(50),  
	@CompanyId int,
	@Variety nvarchar(100),
    @MorningUpMoist decimal(18, 2),
	@MorningDownMoist decimal(18, 2),
	@EvnUpmoist decimal(18, 2),
	@EvnDownMoist decimal(18, 2),
	@Shelling bit,
	@ShellingDate datetime,
	@Lot int,
	@Remarks varchar(1000),
	@isActive bit,
    @OperationType int   
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Get only Active  
    -- 5) Selec All  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[BinMoist]
           ([BinId]
           ,[Year]
           ,[Date]
           ,[CompanyId]
           ,[Variety]
           ,[MorningUpMoist]
           ,[MorningDownMoist]
           ,[EvnUpmoist]
           ,[EvnDownMoist]
           ,[Shelling]
		   ,[ShellingDate]
		   ,[Lot]
           ,[Remarks]
           ,[isActive])
     VALUES
           (@BinId
           ,@Year
           ,@Date
           ,@CompanyId
           ,@Variety
           ,@MorningUpMoist
           ,@MorningDownMoist
           ,@EvnUpmoist
           ,@EvnDownMoist
           ,@Shelling
		   ,@ShellingDate
		   ,@Lot
           ,@Remarks
           ,@isActive)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[BinMoist]
		   SET [BinId] = @BinId
			  ,[Year] = @Year
			  ,[Date] = @Date
			  ,[CompanyId] = @CompanyId
			  ,[Variety] = @Variety
			  ,[MorningUpMoist] = @MorningUpMoist
			  ,[MorningDownMoist] = @MorningDownMoist
			  ,[EvnUpmoist] = @EvnUpmoist
			  ,[EvnDownMoist] = @EvnDownMoist
			  ,[Shelling] = @Shelling
			  ,[Remarks] = @Remarks
			  ,[isActive] = @isActive
			  ,[ShellingDate] = @ShellingDate
			  ,[Lot] = @Lot
		 WHERE BinDailyMoistId = @BinMoistId
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[BinMoist] SET isActive = 0 WHERE BinDailyMoistId = @BinMoistId  
    END  
    ELSE IF @OperationType=4  
    BEGIN  
        SELECT 
		B.BinName, 
		C.CompanyName, 
		BM.* 
		FROM [dbo].[BinMoist] BM
		LEFT JOIN [dbo].[Bins] B ON BM.BinId = B.BinId
		LEFT JOIN [dbo].[Companies] C ON BM.CompanyId = C.CompanyId
		WHERE BM.isActive = 1 AND [Year] = @Year AND BM.BinId = @BinId
    END  
    ELSE   
    BEGIN  
        SELECT * FROM [dbo].[BinMoist]
		WHERE [Year] = @Year
    END  
       
END  