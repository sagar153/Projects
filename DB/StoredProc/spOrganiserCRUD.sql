USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spOrganiserCRUD]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on Organiser table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spOrganiserCRUD]   
    -- Add the parameters for the stored procedure here  
	@OrganiserId int,
	@OrganiserName varchar(100),
	@FatherName varchar(100),
	@Mobile varchar(20),
	@Area varchar(100),
	@Village varchar(100),
	@isActive bit,
	@OperationType int
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Selec All 
	-- 5) All Active
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[Organiser]
           ([OrganiserName]
           ,[FatherName]
           ,[Mobile]
           ,[Area]
           ,[Village]
           ,[isActive])
     VALUES
           (@OrganiserName
           ,@FatherName
           ,@Mobile
           ,@Area
           ,@Village
           ,@isActive)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[Organiser]
   SET [OrganiserName] = @OrganiserName
      ,[FatherName] = @FatherName
      ,[Mobile] = @Mobile
      ,[Area] = @Area
      ,[Village] = @Village
      ,[isActive] = @isActive
 WHERE [OrganiserId] = @OrganiserId
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[Organiser] SET isActive = 0 WHERE [OrganiserId] = @OrganiserId  
    END  
	ELSE IF @OperationType=5  
    BEGIN  
        SELECT * FROM [dbo].[Organiser]	WHERE isActive = 1  
    END  
	ELSE   
    BEGIN  
        SELECT * FROM [dbo].[Organiser]		
    END 
       
END  