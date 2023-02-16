USE [FactoryManagement]  
GO  
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  

DROP PROCEDURE IF EXISTS [dbo].[spGetFactoryOutwardDetails]  
GO
-- =============================================  
-- Author:      <Sagar>   
-- Description: <Get Factory Outtake Data>  
-- =============================================  
CREATE PROCEDURE [dbo].[spGetFactoryOutwardDetails]   
    -- Add the parameters for the stored procedure here  
	@FactoryIntakeId int
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  
      
    SELECT * FROM dbo.FactoryOutward WHERE FactoryIntakeId = @FactoryIntakeId
       
END  