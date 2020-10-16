CREATE TABLE [dbo].[Seal_Using]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Date] [datetime] NULL,
[Employee_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type_document] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DepartmentId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Code_number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Context] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Place_Recipient] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Period_date] [datetime] NULL,
[Employee_Seal_keep] [datetime] NULL,
[Department_confirm] [bit] NOT NULL,
[Employee_Seal_keep_confrim] [bit] NOT NULL,
[Del] [bit] NOT NULL,
[Department_note] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Department_confirm_date] [datetime] NULL,
[Employee_Seal_keep_note] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date_signature] [datetime] NULL,
[Name_signature] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER  [dbo].[update_seal_using_trg] on [dbo].[Seal_Using]
				for update
AS 
BEGIN
	declare @id int,
	@department_confirm bit
	if not exists(select * from deleted)
begin
		select  [@id] = Id
		  from inserted
end
else
--UPDATED
begin
		select  [@id] = s.Id, [@department_confirm] = s.Department_confirm
		  from inserted i inner join seal_using s on i.Id=s.Id
		 
		 if(@department_confirm=1)
			rollback transaction
end		
END
GO
ALTER TABLE [dbo].[Seal_Using] ADD CONSTRAINT [PK_Seal_Using] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
