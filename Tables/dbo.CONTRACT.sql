CREATE TABLE [dbo].[CONTRACT]
(
[ID] [uniqueidentifier] NOT NULL,
[VENDOR] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PERIODID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADREES] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REPRESENTATION] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [datetime] NULL,
[DATE_CREATE] [datetime] NULL,
[CONTRACTNAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONTENT] [varbinary] (max) NULL,
[NOTE] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[USER_CREATE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEPARTMENTID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEL] [bit] NULL,
[MONTHS] [int] NULL,
[CONTRACT_TYPE_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE_MATURITY] [datetime] NULL,
[PLANT] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONTRACT_TYPE_DT_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create trigger [dbo].[insert_update_CONTRACT] on [dbo].[CONTRACT]
for insert, update
as
declare @v_id uniqueidentifier, @v_date_maturity datetime

--INSERTED
if not exists(select * from deleted)
begin
		select @v_id = id,
			   @v_date_maturity = DATEADD(month,months,[date])
		from inserted
end
else
--UPDATED
begin
		--get fields for tentimkiem
		select @v_id = id,
			   @v_date_maturity = DATEADD(month,months,[date])
		from inserted
		
		--update chungtu_log
		/*insert into dbo.ChungTu_Log(So,NgayChungTu,MaKyKetoan,MaDoiTac,GhiChu,MaChungTuLienQuan,TrangThaiThanhToan,HinhThucThanhToan,Thue,MaLoaiChungTu,DaXoa,MaKho,MaNhanVien,NgayCapNhat)
		select So,Ngay,MaKyKeToan,MaDoiTac,isnull(GhiChu,''),isnull(MaChungTuLienQuan,''),isnull(TrangThaiThanhToan,0),HinhThucThanhToan,Thue,MaLoaiChungTu,DaXoa,MaKho,MaNhanVien, getdate()
		from deleted*/
end

update dbo.CONTRACT
set date_maturity = @v_date_maturity
where id = @v_id
GO
ALTER TABLE [dbo].[CONTRACT] ADD CONSTRAINT [PK_CONTRACT] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTRACT] ADD CONSTRAINT [FK_CONTRACT_CONTRACT_TYPE] FOREIGN KEY ([CONTRACT_TYPE_ID]) REFERENCES [dbo].[CONTRACT_TYPE] ([CONTRACT_TYPE_ID])
GO
ALTER TABLE [dbo].[CONTRACT] ADD CONSTRAINT [FK_CONTRACT_CONTRACT_TYPE_DETAIL] FOREIGN KEY ([CONTRACT_TYPE_DT_ID]) REFERENCES [dbo].[CONTRACT_TYPE_DETAIL] ([CONTRACT_TYPE_DT_ID])
GO
ALTER TABLE [dbo].[CONTRACT] ADD CONSTRAINT [FK_CONTRACT_Employee] FOREIGN KEY ([USER_CREATE]) REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[CONTRACT] ADD CONSTRAINT [FK_CONTRACT_PERIOD] FOREIGN KEY ([PERIODID]) REFERENCES [dbo].[PERIOD] ([PERIOD_ID])
GO
