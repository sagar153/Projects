USE [FactoryManagement]
GO
/****** Object:  StoredProcedure [dbo].[spBinCRUD]    Script Date: 12-02-2023 20:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on Bin table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spBinCRUD]   
    -- Add the parameters for the stored procedure here  
	@BinId int,
	@BinName varchar(50),
	@isActive bit,
	@OperationType int
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Selec All  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[Bins]
           ([BinName])
     VALUES
           (@BinName)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[Bins] SET
            [BinName]  = @BinName,
			[isActive] = @isActive
		   WHERE BinId = @BinId  
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[Bins] SET isActive = 0 WHERE BinId = @BinId  
    END 
    ELSE   
    BEGIN  
        SELECT * FROM [dbo].[Bins]		
    END  
       
END  