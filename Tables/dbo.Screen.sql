CREATE TABLE [dbo].[Screen]
(
[ScreenId] [int] NOT NULL,
[ScreenName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HTMLcode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Note] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Screen] ADD CONSTRAINT [PK_Screen] PRIMARY KEY CLUSTERED  ([ScreenId]) ON [PRIMARY]
GO
