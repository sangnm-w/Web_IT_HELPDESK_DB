CREATE TABLE [dbo].[Album]
(
[AlbumId] [int] NOT NULL,
[AlbumTypeId] [int] NULL,
[Title] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price] [numeric] (10, 2) NULL,
[AlbumArtUrl] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album] ADD CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED  ([AlbumId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album] ADD CONSTRAINT [FK_Album_AlbumType] FOREIGN KEY ([AlbumTypeId]) REFERENCES [dbo].[AlbumType] ([AlbumTypeId])
GO
