CREATE TABLE [dbo].[Department]
(
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Plant_Id] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DepartmentName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL,
[Manager_Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant_Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED  ([DepartmentId], [Plant_Id]) ON [PRIMARY]
GO
