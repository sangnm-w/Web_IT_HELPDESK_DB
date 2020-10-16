SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[FUNC_CHECK_EMPNO_MEAL](@V_EMPNO NVARCHAR(10))
RETURNS INT
AS   
BEGIN
 DECLARE @V_CHECK INT;
        SELECT  @V_CHECK = ISNULL(COUNT(ID), 0)  
          FROM HR_EMP_MEAL 
         WHERE dateadd(d, datediff(d,0, [DATETIME]), 0) = dateadd(d, datediff(d,0, GETDATE()), 0)
           AND EMPNO = @V_EMPNO;
    RETURN @V_CHECK;
END;



GO
