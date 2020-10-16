CREATE TABLE [dbo].[Incidents_Log]
(
[Id] [uniqueidentifier] NULL,
[Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[datetime] [datetime] NULL,
[StatusId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LevelId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reply] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[User_create] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[User_resolve] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Note] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileAttched] [varbinary] (max) NULL,
[FileName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DepartmentId] [bit] NULL,
[datetime_log] [datetime] NULL
) ON [PRIMARY]
GO
