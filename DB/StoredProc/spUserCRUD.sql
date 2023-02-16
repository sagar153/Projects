USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spUserCRUD]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on User table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spUserCRUD]   
    -- Add the parameters for the stored procedure here  
	@UserId int,
	@UserName varchar(100),
	@Password varchar(100),
	@Admin bit,
	@User bit,
	@Full bit,
	@FactoryOnly bit,
	@isActive bit,
	@OperationType int
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Select user by username and password for authentication
	-- 5) Get All users
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[User]
           ([UserName]
           ,[Password]
           ,[Admin]
           ,[User]
           ,[Full]
           ,[FactoryOnly]
           ,[isActive])
     VALUES
           (@UserName
           ,@Password
           ,@Admin
           ,@User
           ,@Full
           ,@FactoryOnly
           ,@isActive)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[User] SET
            [UserName] = @UserName
           ,[Password] = @Password
           ,[Admin] = @Admin
           ,[User] = @User
           ,[Full] = @Full
           ,[FactoryOnly] = @FactoryOnly
           ,[isActive]= @isActive
		   WHERE UserId = @UserId  
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[User] SET isActive = 0 WHERE UserId = @UserId  
    END  
	ELSE IF @OperationType=4  
    BEGIN  
        SELECT * FROM [dbo].[User]	WHERE LOWER(UserName) = LOWER(@UserName) AND [Password] = @Password AND isActive = 1  
    END  
	ELSE   
    BEGIN  
        SELECT * FROM [dbo].[User]		
    END 
       
END  