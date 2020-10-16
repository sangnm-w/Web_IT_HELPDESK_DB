CREATE TABLE [dbo].[EMP_ANSWER_bk20190826]
(
[ID] [uniqueidentifier] NOT NULL,
[QUESTION_ID] [uniqueidentifier] NULL,
[EMPLOYEEID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [datetime] NULL,
[ANSWERID] [int] NULL,
[NOTE] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
