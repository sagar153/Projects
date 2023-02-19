USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spOrgAdvanceCRUD]  
GO
-- =============================================  
-- Author:      <Naveen>   
-- Description: <Perform crud operation on production table>  
-- =============================================  
CREATE PROCEDURE [dbo].[spOrgAdvanceCRUD]   
    -- Add the parameters for the stored procedure here  
	@OrganiserAdvanceId int,
	@Year nvarchar(50),
	@OrganiserId int,  
	@OrganiserName varchar(100) = '',  
	@Advance decimal(18,2),
	@AdvanceDate datetime,
	@Mode varchar(200),
	@Remarks nvarchar(1000),
    @OperationType int   
    --================================================  
    --operation types   
    -- 1) Insert  
    -- 2) Update  
    -- 3) Delete  
    -- 4) Select Active Record  
    -- 5) Selec All  
	-- 6) By AdvanceId
	-- 7) Distinct Org - Advance
	-- 8) By Org Id
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    --select operation  
    IF @OperationType=1  
    BEGIN  
        INSERT INTO [dbo].[OrganiserAdvance]
           ([OrganiserId]
		   ,[Year]
           ,[Advance]
           ,[AdvanceDate]
           ,[Mode]
           ,[Remarks])
     VALUES
           (@OrganiserId
		   ,@Year
           ,@Advance
           ,@AdvanceDate
           ,@Mode
           ,@Remarks
           )
    END  
    ELSE IF @OperationType=2  
    BEGIN  
       UPDATE [dbo].[OrganiserAdvance]
   SET [OrganiserId] = @OrganiserId
      ,[Year] = @Year
      ,[Advance] = @Advance
      ,[AdvanceDate] = @AdvanceDate
      ,[Mode] = @Mode
      ,[Remarks] = @Remarks
    WHERE OrganiserAdvanceId =@OrganiserAdvanceId
    END  
    ELSE IF @OperationType=3  
    BEGIN  
        UPDATE [dbo].[OrganiserAdvance] SET isActive = 0 WHERE OrganiserAdvanceId =@OrganiserAdvanceId  
    END  
    ELSE IF @OperationType=4  
    BEGIN  
        SELECT O.OrganiserName,OA.* FROM [dbo].[OrganiserAdvance] OA
		LEFT JOIN [dbo].[Organiser] O ON OA.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND OA.isActive = 1           
    END
	ELSE IF @OperationType=6  
    BEGIN  
        SELECT * FROM [dbo].[OrganiserAdvance] 
		WHERE [Year] = @Year  AND OrganiserAdvanceId =@OrganiserAdvanceId         
    END
	ELSE IF @OperationType=7  
    BEGIN  
	    SELECT O.OrganiserName,SUM(OA.Advance) Advance FROM [dbo].[OrganiserAdvance] OA
		LEFT JOIN [dbo].[Organiser] O ON OA.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year  AND OA.isActive = 1
		Group By OrganiserName
    END
	ELSE IF @OperationType=8  
    BEGIN  
        SELECT O.OrganiserName, OA.* FROM [dbo].[OrganiserAdvance] OA
		LEFT JOIN [dbo].[Organiser] O ON OA.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year AND OA.isActive = 1 AND O.OrganiserName = @OrganiserName           
    END
    ELSE   
    BEGIN  
        SELECT O.OrganiserName,OA.* FROM [dbo].[OrganiserAdvance] OA
		LEFT JOIN [dbo].[Organiser] O ON OA.OrganiserId = O.OrganiserId
		WHERE [Year] = @Year
    END  
       
END  