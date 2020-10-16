CREATE TABLE [dbo].[CONTRACT_TYPE_DETAIL]
(
[CONTRACT_TYPE_DT_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CONTRACT_TYPE_NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTRACT_TYPE_DETAIL] ADD CONSTRAINT [PK_CONTRACT_TYPE_DETAIL] PRIMARY KEY CLUSTERED  ([CONTRACT_TYPE_DT_ID]) ON [PRIMARY]
GO
