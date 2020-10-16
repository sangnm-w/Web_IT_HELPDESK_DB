CREATE TABLE [dbo].[EmployeeInfo]
(
[EMPNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEPT_NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FULL_NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GRADE] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POSITION_NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JOB_NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMP_STATUS] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTHDAY] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HIRE_DATE] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXTENSION] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REMARK] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DE] [bit] NULL,
[DEPT] [nchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeInfo] ADD CONSTRAINT [PK_EmployeeInfo] PRIMARY KEY CLUSTERED  ([EMPNO]) ON [PRIMARY]
GO
