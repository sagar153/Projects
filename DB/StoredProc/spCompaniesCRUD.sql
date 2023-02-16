USE [FactoryManagement]
GO
/****** Object:  StoredProcedure [dbo].[spBinCRUD]    Script Date: 12-02-2023 23:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on companies table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spCompaniesCRUD]   
    -- Add the parameters for the stored procedure here  
	@CompanyId int,
	@CompanyName varchar(50),
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
        INSERT INTO [dbo].[Companies]
           ([CompanyName])
     VALUES
           (@CompanyName)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[Companies] SET
            [CompanyName]  = @CompanyName,
			[isActive] = @isActive
		   WHERE CompanyId = @CompanyId  
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[Companies] SET isActive = 0 WHERE CompanyId = @CompanyId
    END 
    ELSE IF @OperationType=4
	BEGIN
		SELECT * FROM [dbo].[Companies]	WHERE isActive = 1
	END
    ELSE  
        SELECT * FROM [dbo].[Companies]		
    END  
       