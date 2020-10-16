CREATE TABLE [dbo].[Document]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileContext] [varbinary] (max) NULL,
[EmployeeID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DocumentTypeId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime] NULL,
[Del] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_DocumentType] FOREIGN KEY ([DocumentTypeId]) REFERENCES [dbo].[DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Document] ADD CONSTRAINT [FK_Document_Employee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([EmployeeID])
GO
