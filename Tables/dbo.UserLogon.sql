CREATE TABLE [dbo].[UserLogon]
(
[UserLogIn] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Password] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLogon] ADD CONSTRAINT [PK_UserLogon] PRIMARY KEY CLUSTERED  ([UserLogIn]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLogon] ADD CONSTRAINT [FK_UserLogon_Employee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID])
GO
