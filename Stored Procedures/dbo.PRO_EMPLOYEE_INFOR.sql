SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PRO_EMPLOYEE_INFOR] (@v_EMPNO nvarchar(50),@v_DEPT_NAME nvarchar(200), @v_FULLNAME nvarchar(200),
									@v_GRADE nchar(200), @v_POSITION_NAME nvarchar(200), @v_JOB_NAME nvarchar(200),
									@v_EMP_STATUS nvarchar(200), @v_BIRTHDAY nchar(10),@v_HIRE_DATE nchar(10),
									@v_PHONE nvarchar(200), @v_EXTENSION nvarchar(200), @v_REMARK nvarchar(200),
									@v_DEPT nchar(4), @v_EMAIL nvarchar(200), @v_PLANT nchar(10))
AS
BEGIN

--EmployeeInfo
begin
	declare @v_count_emp int;
	set @v_count_emp = 
				   (select COUNT(*) as COUNT_EMPNO
					  from EmployeeInfo 
					 where EMPNO = @v_EMPNO)
	if @v_count_emp = 1  
					update EmployeeInfo
					   set DE = 0
					 where EMPNO = @v_EMPNO; -- nhân viên còn làm việc chỉ update 1 nhân viên
	else

	if @v_count_emp = 0 
		insert into EmployeeInfo
				values (@v_EMPNO ,@v_DEPT_NAME , @v_FULLNAME,
						@v_GRADE , @v_POSITION_NAME , @v_JOB_NAME ,
						@v_EMP_STATUS , @v_BIRTHDAY ,@v_HIRE_DATE ,
						@v_PHONE , @v_EXTENSION , @v_REMARK ,
						0 , @v_DEPT, @v_EMAIL , @v_PLANT)
end
					
-- Employee  EMPLOYEENAME, EMPLOYEEID, DEL, DEPATMENTID, PASSWORD, PLANT
begin
	declare @v_count_emp_2 int;
	set @v_count_emp_2 = 
				   (select COUNT(*) as COUNT_EMPNO
					from Employee 
					where EMPLOYEEID = @v_EMPNO
					  AND PLANT      = @v_PLANT)
					
	if @v_count_emp_2 = 1  --and @v_PLANT = '0304'
					update Employee
					   set Del = 0
					 where EMPLOYEEID = @v_EMPNO -- nhân viên còn làm việc chỉ update 1 nhân viên
					   AND PLANT      = @v_PLANT;
	else if @v_count_emp_2 = 0 --and @v_PLANT = '0304'
	begin	-- phân quyền helpdesk
	if(@v_DEPT='0512')
		set @v_DEPT = '0501'
		
	INSERT INTO Employee(EMPLOYEENAME, EMPLOYEEID, DEL, DEPATMENTID, PASSWORD, PLANT)
			values ( @v_FULLNAME,@v_EMPNO, 0 , @v_DEPT, @v_EMPNO , @v_PLANT);
			
	INSERT INTO Employee_Screen
		 SELECT NEWID(),ScreenId,@v_EMPNO,1,1
		   FROM Employee_Screen
		  WHERE EmployeeID in ('890948')
		    AND @v_EMPNO NOT IN (SELECT EmployeeId
		                           FROM Employee_Screen)
	end
				
    
end
END

GO
