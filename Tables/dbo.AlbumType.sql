CREATE TABLE [dbo].[AlbumType]
(
[AlbumTypeId] [int] NOT NULL,
[AlbumType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlbumType] ADD CONSTRAINT [PK_AlbumType] PRIMARY KEY CLUSTERED  ([AlbumTypeId]) ON [PRIMARY]
GO
