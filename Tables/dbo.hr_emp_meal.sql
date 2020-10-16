CREATE TABLE [dbo].[hr_emp_meal]
(
[Id] [uniqueidentifier] NOT NULL,
[Num] [int] NOT NULL,
[EMPNO] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMAGE] [varbinary] (max) NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateTime] [datetime] NULL,
[Del] [bit] NULL,
[TypeMeal] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[MEAL_TRIGGER] ON [dbo].[hr_emp_meal]
FOR INSERT
AS
declare @v_Id uniqueidentifier,
 --@v_Num int,
 @v_EMPNO nvarchar(10),
 @v_IMAGE varbinary(MAX),
 @v_Note nvarchar(MAX),
 @v_DateTime datetime,
 @v_Del	bit,
--Id Num EMPNO IMAGE Note  DateTime Del TypeMeal
 @v_TypeMeal nvarchar(10)
BEGIN
if exists(select * from inserted)
BEGIN
	SELECT @v_Id = Id,
		   --@v_Num = Num,
		   @v_EMPNO = EMPNO,
		   @v_IMAGE = [Image],
		   @v_Note =Note,
		   @v_DateTime = [DateTime],
		   @v_Del = Del
	  FROM inserted;

SET @v_TypeMeal = SUBSTRING(CONVERT(char(5), GETDATE(), 108),1,2) +  SUBSTRING(CONVERT(char(5), GETDATE(), 108),4,2);
	IF(@v_TypeMeal >= '0800' AND @v_TypeMeal <= '1300')
		insert into dbo.HR_EMP_MEAL(Id, EMPNO, [Image], Note, [DateTime],Del, TypeMeal)
	     values (@v_Id, @v_EMPNO, @v_IMAGE , @v_Note,@v_DateTime,@v_Del, 'S')
	ELSE IF(@v_TypeMeal >= '1600' AND @v_TypeMeal <= '2000')
		insert into dbo.HR_EMP_MEAL(Id,  EMPNO, [Image], Note, [DateTime],Del, TypeMeal)
	     values (@v_Id,  @v_EMPNO, @v_IMAGE , @v_Note,@v_DateTime,@v_Del, 'C')
	ELSE IF(@v_TypeMeal >= '2000' AND @v_TypeMeal <= '2359' OR @v_TypeMeal >= '0001' AND @v_TypeMeal<= '0359')
		insert into dbo.HR_EMP_MEAL(Id,  EMPNO, [Image], Note, [DateTime],Del, TypeMeal)
	     values (@v_Id, @v_EMPNO, @v_IMAGE , @v_Note,@v_DateTime,@v_Del, 'T')
END
END
GO
