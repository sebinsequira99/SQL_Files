

--CREATING PROCEDURE FOR INSERTING VALUES INTO TABLES 

IF exists (select 1 from sys.objects where name='usp_insertcompanyid' and type='p')
DROP PROCEDURE usp_insertcompanyid;

CREATE PROCEDURE usp_insertcompanyid 
					@companyname varchar(100),
					@companyaddress varchar(400),
					@EmployeeFirstName Varchar(200),
					@EmployeeLastName Varchar(200),
					@EmployeeMiddleName Varchar(200), 
					@EmailID Varchar(100),
					@MobileNumber Varchar(9),
					@designation Varchar(50),
					@isdeleted Bit 
AS
BEGIN
		INSERT INTO		company(companyname,
								companyaddress)
						VALUES(@companyname,
								@companyaddress);
		INSERT INTO employee(EmployeeFirstName,
								EmployeeLastName,
								EmployeeMiddleName,
								EmailID,
								MobileNumber,
								designation,
								isdeleted)
						VALUES(@EmployeeFirstName,
								@EmployeeLastName,
								@EmployeeMiddleName,
								@EmailID,
								@MobileNumber,
								@designation,
								@isdeleted);

END

--EXECUTING PROCEDURE

EXEC usp_insertcompanyid 
		@companyname='cts',
		@companyaddress='ctsaddress',
		@EmployeeFirstName='d',
		@EmployeeLastName='f',
		@EmployeeMiddleName='e',
		@EmailID='def@gmail.com',
		@MobileNumber=987654321,
		@designation='trainee',
		@isdeleted=0;

EXEC usp_insertcompanyid 
		@companyname='tcs',
		@companyaddress='tcsaddress',
		@EmployeeFirstName='a',
		@EmployeeLastName='c',
		@EmployeeMiddleName='b',
		@EmailID='abc@gmail.com',
		@MobileNumber=123456789,
		@designation='trainee',
		@isdeleted=1;