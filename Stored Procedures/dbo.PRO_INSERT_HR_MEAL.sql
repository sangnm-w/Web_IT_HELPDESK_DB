SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PRO_INSERT_HR_MEAL](        @V_EMPNO           NVARCHAR(10),
                                                   @V_IMAGE       VARBINARY(MAX),
                                                   @V_Note        NVARCHAR(MAX)
                                                   ) AS
BEGIN
  --IF (DBO.FUNC_CHECK_EMPNO_MEAL(@V_EMPNO) = 0 )
    INSERT INTO HR_EMP_MEAL
      (ID,
       EMPNO,
       [IMAGE],
       NOTE,
       [DATETIME],
       DEL)
    VALUES
      (NEWID(),
       @V_EMPNO,
       @V_IMAGE,
       @V_Note,
       GETDATE(),
       'FALSE'
        );
   --COMMIT;
  --ELSE IF(@V_IMAGE IS NOT NULL)
  --  UPDATE HR_EMP_MEAL
  --     SET [IMAGE]      = @V_IMAGE,
  --         NOTE         = @V_Note
  --  WHERE EMPNO        = @V_EMPNO
  --  AND [DATETIME]  = GETDATE();
  --ELSE
  --UPDATE HR_EMP_MEAL
  --   SET NOTE         = @V_Note
  --  WHERE EMPNO        = @V_EMPNO
  --  AND [DATETIME]  = GETDATE();
END;
GO
