CREATE TABLE [dbo].[Drinking_Request]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Quantity] [int] NULL,
[Unit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime] NULL,
[Department_confirm] [bit] NOT NULL,
[Department_note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Department_confirm_date] [datetime] NULL,
[HR_confirm] [bit] NOT NULL,
[HR_note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HR_confirm_date] [datetime] NULL,
[Del] [bit] NOT NULL,
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employee_name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drinking_Request] ADD CONSTRAINT [PK_Drinking_Request] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
