CREATE TABLE [dbo].[Incidents]
(
[Id] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[datetime] [datetime] NULL,
[StatusId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LevelId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reply] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[User_create] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[User_resolve] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Note] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileAttched] [varbinary] (max) NULL,
[FileName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Del] [bit] NULL,
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Solved] [bit] NULL,
[Solve_datetime] [datetime] NULL,
[Plant] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER  [dbo].[insert_update_Incidents_trg] on [dbo].[Incidents]
				for insert, update
AS 
BEGIN
	declare @id uniqueidentifier,
	@code nvarchar(50) ,
	@datetime datetime ,
	@statusId nvarchar(50) ,
	@levelId nvarchar(50) ,
	@reply nvarchar(200) ,
	@user_create nvarchar(50) ,
	@user_resolve nvarchar(50) ,
	@note nvarchar(200) ,
	@fileAttched varbinary(max) ,
	@fileName nvarchar(100) ,
	@departmentId nvarchar(50)
	
	if not exists(select * from deleted)
begin
		select [@id] = Id,
				[@code] = Code ,
				[@datetime] = [datetime] ,
				[@statusId] =  StatusId,
				[@levelId] = LevelId ,
				[@reply] = Reply ,
				[@user_create] = User_create ,
				[@user_resolve] = User_resolve ,
				[@note]  = Note,
				[@fileAttched] = FileAttched ,
				[@fileName] = [FileName],
				[@departmentId]= DepartmentId
		from inserted
end
else
--UPDATED
begin
		--get fields for tentimkiem
		select [@id] = Id,
				[@code] = Code ,
				[@datetime] = [datetime] ,
				[@statusId] =  StatusId,
				[@levelId] = LevelId ,
				[@reply] = Reply ,
				[@user_create] = User_create ,
				[@user_resolve] = User_resolve ,
				[@note]  = Note,
				[@fileAttched] = FileAttched,
				[@fileName] = FileAttched,
				[@departmentId]= DepartmentId
		from inserted
end		
		--update chungtu_log
		insert into dbo.Incidents_Log(Id, Code,[datetime], StatusId, LevelId, Reply, User_create, User_resolve, Note, FileAttched, [FileName], DepartmentId,datetime_log)
		select Id, Code,[datetime], StatusId, LevelId, Reply, User_create, User_resolve, Note, FileAttched, [FileName], DepartmentId, getdate()
		from deleted

END
GO
ALTER TABLE [dbo].[Incidents] ADD CONSTRAINT [PK_Incidents] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
