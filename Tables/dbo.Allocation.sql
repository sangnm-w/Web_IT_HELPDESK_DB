CREATE TABLE [dbo].[Allocation]
(
[Allocation_Id] [uniqueidentifier] NOT NULL,
[Device_Id] [uniqueidentifier] NULL,
[Memo_Id] [uniqueidentifier] NULL,
[Allocation_Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Deliver] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Receiver] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Delivery_Date] [datetime] NULL,
[Return_Date] [datetime] NULL,
[Department_Id] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plant_Id] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Create_Date] [datetime] NULL,
[Delete_Date] [datetime] NULL,
[Flag_ReAllocation] [bit] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<NGUYEN MINH SANG>
-- Create date: <2020-10-08>
-- Description:	<Set (Flag_Return = False) of all allocations following Device_Id, exception the last one (Flag_Return = True)>
-- =============================================
CREATE TRIGGER [dbo].[Trigger_SetFlagReturn]
   ON  [dbo].[Allocation]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Device_Id UNIQUEIDENTIFIER;

	SELECT @Device_Id = ( SELECT TOP 1 Device_Id FROM inserted i)

	UPDATE Allocation SET Flag_ReAllocation = 0 WHERE Device_Id = @Device_Id AND Allocation_Id NOT IN (SELECT TOP 1 Allocation_Id FROM Allocation WHERE Device_Id = @Device_Id ORDER BY Delivery_Date DESC)

END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<NGUYEN MINH SANG>
-- Create date: <2020-10-08>
-- Description:	Sync status of device (Using | Instock)
-- =============================================
CREATE TRIGGER [dbo].[Trigger_SyncStatusDevice]
   ON [dbo].[Allocation]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
    DECLARE @Device_Id UNIQUEIDENTIFIER
	DECLARE @Device_Status NVARCHAR(10)
	DECLARE @NotReturn_Count INT
	SELECT @Device_Id = ( SELECT TOP 1 Device_Id FROM inserted i)

	SELECT @NotReturn_Count = COUNT(*) FROM Allocation WHERE Device_ID = @Device_Id AND Return_Date IS NOT NULL

	IF @NotReturn_Count > 0
	BEGIN
		UPDATE Device SET Device_Status = 'Using'
	END
END
GO
ALTER TABLE [dbo].[Allocation] ADD CONSTRAINT [PK_Allocation] PRIMARY KEY CLUSTERED  ([Allocation_Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Allocation] ADD CONSTRAINT [FK_Allocation_Department] FOREIGN KEY ([Department_Id], [Plant_Id]) REFERENCES [dbo].[Department] ([DepartmentId], [Plant_Id])
GO
ALTER TABLE [dbo].[Allocation] ADD CONSTRAINT [FK_Allocation_Device] FOREIGN KEY ([Device_Id]) REFERENCES [dbo].[Device] ([Device_Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Apply only lastest instock record = FALSE', 'SCHEMA', N'dbo', 'TABLE', N'Allocation', 'COLUMN', N'Flag_ReAllocation'
GO
