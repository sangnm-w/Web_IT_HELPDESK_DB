CREATE TABLE [dbo].[Event]
(
[ID] [int] NOT NULL,
[TITLE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[START] [datetime] NULL,
[END] [datetime] NULL,
[STATUS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
