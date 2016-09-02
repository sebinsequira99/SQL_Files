

--CREATING PROCEDURE FOR INSERTING EMPLOYEE SALARY DETAILS

IF exists (select 1 from sys.objects where name='usp_insertempsalarydetails' and type='p')
DROP PROCEDURE usp_insertempsalarydetails;

CREATE PROCEDURE usp_insertempsalarydetails( 
					@Salary Decimal(18,2),
					@Month int,
					@Year int)
AS
BEGIN
		INSERT INTO EmployeeSalaryDtls(Salary,
										Month,
										Year)
								VALUES(@Salary,
										@Month,
										@Year);

END

EXEC usp_insertempsalarydetails 
		@Salary=1000,
		@Month=1,
		@Year=2014;

EXEC usp_insertempsalarydetails 
		@Salary=2000,
		@Month=1,
		@Year=2014;

EXEC usp_insertempsalarydetails 
		@Salary=3000,
		@Month=1,
		@Year=2014;

