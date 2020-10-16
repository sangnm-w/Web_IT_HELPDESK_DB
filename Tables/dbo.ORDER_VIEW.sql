CREATE TABLE [dbo].[ORDER_VIEW]
(
[ORDER_VIEW_ID] [bigint] NULL,
[TITLE] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNIT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HR] [numeric] (38, 2) NULL,
[ACCOUNTING] [numeric] (38, 2) NULL,
[ANIMAL] [numeric] (38, 2) NULL,
[AQUA] [numeric] (38, 2) NULL,
[HSE] [numeric] (38, 2) NULL,
[LOGISTIC] [numeric] (38, 2) NULL,
[MARKETING] [numeric] (38, 2) NULL,
[MAINTANANCE] [numeric] (38, 2) NULL,
[PURCHASING] [numeric] (38, 2) NULL,
[QC] [numeric] (38, 2) NULL,
[R&D] [numeric] (38, 2) NULL,
[SALES SUPPORT] [numeric] (38, 2) NULL
) ON [PRIMARY]
GO
