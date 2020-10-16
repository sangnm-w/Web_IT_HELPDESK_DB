CREATE TABLE [dbo].[Employee]
(
[EmployeeID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmployeeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IDNumber] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Others] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status_marry] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [datetime] NULL,
[datetimeBegin] [datetime] NULL,
[CellPhone] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Notes] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SearchField] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL,
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[administrator] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED  ([EmployeeID]) ON [PRIMARY]
GO
