CREATE TABLE [dbo].[Device_Type]
(
[Device_Type_Id] [int] NOT NULL IDENTITY(1, 1),
[Device_Type_Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Device_Type] ADD CONSTRAINT [PK__Device_T__69370205E1EB41E5] PRIMARY KEY CLUSTERED  ([Device_Type_Id]) ON [PRIMARY]
GO
