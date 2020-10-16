CREATE TABLE [dbo].[OrderDetail]
(
[OrderDetailId] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NULL,
[AlbumId] [int] NULL,
[Quantity] [numeric] (10, 2) NULL,
[Note] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetail] ADD CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED  ([OrderDetailId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetail] ADD CONSTRAINT [FK_OrderDetail_Album] FOREIGN KEY ([AlbumId]) REFERENCES [dbo].[Album] ([AlbumId])
GO
ALTER TABLE [dbo].[OrderDetail] ADD CONSTRAINT [FK_OrderDetail_Order_] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order_] ([OrderId])
GO
