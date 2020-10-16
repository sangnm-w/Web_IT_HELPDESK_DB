CREATE TABLE [dbo].[Status]
(
[StatusId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StatusName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Status] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED  ([StatusId]) ON [PRIMARY]
GO
