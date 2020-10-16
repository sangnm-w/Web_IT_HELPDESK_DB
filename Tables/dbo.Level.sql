CREATE TABLE [dbo].[Level]
(
[LevelId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LevelName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[datetime_rate] [int] NULL,
[Del] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Level] ADD CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED  ([LevelId]) ON [PRIMARY]
GO
