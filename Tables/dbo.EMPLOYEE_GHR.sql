CREATE TABLE [dbo].[EMPLOYEE_GHR]
(
[Emp_Id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Emp_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Emp_Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID_Number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [datetime] NULL,
[Marital_Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Position] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hire_Date] [datetime] NULL,
[Termination_Date] [datetime] NULL,
[Department_Id] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant_Id] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL,
[Password] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Administrator] [bit] NULL
) ON [PRIMARY]
GO
