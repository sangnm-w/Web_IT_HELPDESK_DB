CREATE TABLE [dbo].[Cart]
(
[RecordId] [int] NOT NULL IDENTITY(1, 1),
[CartId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AlbumId] [int] NULL,
[Count] [int] NULL,
[DateCreated] [datetime] NULL,
[Note] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED  ([RecordId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD CONSTRAINT [FK_Cart_Album] FOREIGN KEY ([AlbumId]) REFERENCES [dbo].[Album] ([AlbumId])
GO
