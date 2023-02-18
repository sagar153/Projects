USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spProductionCRUD]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on production table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spProductionCRUD]   
    -- Add the parameters for the stored procedure here  
	@ProductionId int,
	@Year nvarchar(50),
	@OrganiserId int,  
	@FatherName varchar(100),
	@Mobile varchar(20),
    @FarmerName nvarchar(100), 
	@ACRES decimal(18, 2),
	@Variety nvarchar(50),
	@SurveyNo nvarchar(50),
	@Village nvarchar(100),
	@Area nvarchar(100),
	@ShowingDate datetime,
	@HarvestDate datetime,
	@TotalTonnage decimal(18, 2),
	@AddDate datetime,
	@Remarks nvarchar(1000),
    @OperationType int   
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Select Active Record  
    -- 5) Selec All  
	-- 6) By Id
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[Production]
           ([Year]
           ,[OrganiserId]
		   ,[FatherName]
		   ,[Mobile]
           ,[FarmerName]
           ,[ACRES]
           ,[Variety]
           ,[SurveyNo]
           ,[Village]
           ,[Area]
           ,[ShowingDate]
           ,[HarvestDate]
           ,[TotalTonnage]           
           ,[AddDate]
           ,[Remarks])
     VALUES
           (@Year
           ,@OrganiserId
		   ,@FatherName
		   ,@Mobile
           ,@FarmerName
           ,@ACRES
           ,@Variety
           ,@SurveyNo
           ,@Village
           ,@Area
           ,@ShowingDate
           ,@HarvestDate
           ,@TotalTonnage
           ,@AddDate
           ,@Remarks)
    END  
    ELSE IF @OperationType=2  
    BEGIN  
        UPDATE [dbo].[Production] SET
            [Year] = @Year
           ,[OrganiserId] = @OrganiserId
		   ,[FatherName] = @FatherName
		   ,[Mobile] = @Mobile
           ,[FarmerName] = @FarmerName
           ,[ACRES] = @ACRES
           ,[Variety]= @Variety
           ,[SurveyNo] = @SurveyNo
           ,[Village]= @Village
           ,[Area] = @Area
           ,[ShowingDate] = @ShowingDate
           ,[HarvestDate] = @HarvestDate
           ,[TotalTonnage]= @TotalTonnage
           ,[AddDate] = @AddDate
           ,[Remarks] = @Remarks           
		   WHERE ProductionId = @ProductionId  
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[Production] SET isActive = 0 WHERE ProductionId = @ProductionId  
    END  
    ELSE IF @OperationType=4  
    BEGIN  
        SELECT O.OrganiserName,P.* FROM [dbo].[Production] P
		LEFT JOIN [dbo].[Organiser] O ON P.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND P.isActive = 1           
    END
	ELSE IF @OperationType=6  
    BEGIN  
        SELECT * FROM [dbo].[Production] 
		WHERE [Year] = @Year  AND ProductionId = @ProductionId           
    END
    ELSE   
    BEGIN  
        SELECT O.OrganiserName, P.* FROM [dbo].[Production] P
		LEFT JOIN [dbo].[Organiser] O ON P.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year
    END  
       
END  