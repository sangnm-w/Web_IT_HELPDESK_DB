CREATE TABLE [dbo].[Order_]
(
[OrderId] [int] NOT NULL IDENTITY(1, 1),
[OrderDate] [datetime] NULL,
[Total] [numeric] (10, 2) NULL,
[Note] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Confirmed] [bit] NULL,
[EmployeeID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employee_Name] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL,
[Plant] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order_] ADD CONSTRAINT [PK_Order_] PRIMARY KEY CLUSTERED  ([OrderId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order_] ADD CONSTRAINT [FK_Order__Employee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID])
GO
