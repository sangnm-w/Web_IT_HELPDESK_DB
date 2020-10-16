CREATE TABLE [dbo].[BIZ_TRIP]
(
[EMPNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEPT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VEHICLE] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONTACT_COMPANY] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONTACT_PERSON] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONTACT_DEPT] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [datetime] NULL,
[FROM_DATE] [datetime] NULL,
[TO_DATE] [datetime] NULL,
[USED_EQUIPMENT] [bit] NULL,
[REMARK] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLANT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEPT_CONFIRM] [bit] NULL,
[DEPT_CONFIRM_IMAGE] [varbinary] (max) NULL,
[HR_CONFIRM] [bit] NULL,
[HR_CONFIRM_IMAGE] [varbinary] (max) NULL,
[DEL] [bit] NULL,
[ID] [uniqueidentifier] NOT NULL,
[NO] [int] NOT NULL IDENTITY(1, 1),
[IT_CONFIRM] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BIZ_TRIP] ADD CONSTRAINT [PK_BIZ_TRIP] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BIZ_TRIP] ADD CONSTRAINT [FK_BIZ_TRIP_Employee] FOREIGN KEY ([EMPNO]) REFERENCES [dbo].[Employee] ([EmployeeID])
GO
