CREATE TABLE [dbo].[Department_BK200916]
(
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Plant] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DepartmentName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL,
[Manager_Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department_BK200916] ADD CONSTRAINT [PK_Department_BK200916] PRIMARY KEY CLUSTERED  ([DepartmentId], [Plant]) ON [PRIMARY]
GO
