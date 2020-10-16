SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PRO_DE_STATUS] (@V_PLANT nchar(10))
AS
BEGIN
	UPDATE EmployeeInfo
	   SET DE = 1 --true
	WHERE PLANT = @V_PLANT
	  AND DEPT NOT IN ('9999','0322','0311')
	        
END
GO
