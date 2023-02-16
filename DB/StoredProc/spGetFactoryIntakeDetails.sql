USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spGetFactoryIntakeDetails]  
GO
-- =============================================  
-- Author:      <Sagar>   
-- Description: <Get Factory Intake Data>  
-- =============================================  
CREATE PROCEDURE [dbo].[spGetFactoryIntakeDetails]   
    -- Add the parameters for the stored procedure here  
	@FactoryIntakeId int
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    SELECT * FROM dbo.FactoryIntake WHERE FactoryIntakeId = @FactoryIntakeId
       
END  