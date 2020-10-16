CREATE TABLE [dbo].[PERIOD]
(
[PERIOD_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PERIOD_NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MONTHS] [int] NULL,
[DEL] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PERIOD] ADD CONSTRAINT [PK_PERIOD] PRIMARY KEY CLUSTERED  ([PERIOD_ID]) ON [PRIMARY]
GO