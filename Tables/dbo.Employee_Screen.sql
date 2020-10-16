CREATE TABLE [dbo].[Employee_Screen]
(
[Id] [uniqueidentifier] NOT NULL,
[ScreenId] [int] NULL,
[EmployeeId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Use] [bit] NULL,
[Read] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee_Screen] ADD CONSTRAINT [PK_Employee_Screen] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee_Screen] ADD CONSTRAINT [FK_Employee_Screen_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee_Screen] ADD CONSTRAINT [FK_Employee_Screen_Screen] FOREIGN KEY ([ScreenId]) REFERENCES [dbo].[Screen] ([ScreenId])
GO
