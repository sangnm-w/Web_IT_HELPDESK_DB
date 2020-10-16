CREATE TABLE [dbo].[Device]
(
[Device_Id] [uniqueidentifier] NOT NULL,
[Contract_Id] [uniqueidentifier] NULL,
[Device_Type_Id] [int] NULL,
[Device_Code] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Device_Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Serial_No] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Purchase_Date] [datetime] NULL,
[CPU] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RAM] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DISK] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Operation_System] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OS_License] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Office] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Office_License] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Other_Spec] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Depreciation] [datetime] NULL,
[Device_Status] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Addition_Information] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant_Id] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Create_Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Device] ADD CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED  ([Device_Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Device] ADD CONSTRAINT [FK_Device_CONTRACT] FOREIGN KEY ([Contract_Id]) REFERENCES [dbo].[CONTRACT] ([ID])
GO
ALTER TABLE [dbo].[Device] ADD CONSTRAINT [FK_Device_Device_Type] FOREIGN KEY ([Device_Type_Id]) REFERENCES [dbo].[Device_Type] ([Device_Type_Id])
GO
