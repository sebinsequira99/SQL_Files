


--DATABASE CREATION

CREATE DATABASE testdb2
USE testdb2

--CREATING TABLES COMPANY AND EMPLOYEE

IF exists (select 1 from sys.objects where name='company' and type='u')
DROP TABLE company;

CREATE TABLE company(companyid int identity(1,1)
					,companyname varchar(100)
					,companyaddress varchar(400));

IF exists (select 1 from sys.objects where name='employee' and type='u')
DROP TABLE employee;

CREATE TABLE employee(EmployeeID int identity(1000,1) not null
						,EmployeeFirstName Varchar(200)
						,EmployeeLastName Varchar(200)
						,EmployeeMiddleName Varchar(200)
						,EmailID Varchar(100)
						,MobileNumber Varchar(9)
						,designation Varchar(50)
						,isdeleted Bit default 0
						,companyid Int);

--ADDING PRIMARY KEYS

IF exists (select 1 from sys.objects where name='PK_company_companyid' and type='pk')
ALTER table company
DROP constraint PK_company_companyid;

ALTER TABLE company
ADD CONSTRAINT PK_company_companyid primary key(companyid);

IF exists (select 1 from sys.objects where name='PK_employee_employeeid' and type='pk')
ALTER table employee
DROP constraint PK_employee_employeeid;

ALTER TABLE employee
ADD CONSTRAINT PK_employee_employeeid primary key(employeeid);

--ADDING FOREIGN KEY

IF exists (select 1 from sys.objects where name='FK_employee_Employeeid' and type='f')
ALTER table employee
DROP CONSTRAINT FK_employee_Employeeid;

ALTER TABLE employee
ADD CONSTRAINT FK_employee_Employeeid foreign key(companyid)
REFERENCES company(companyid);

--ADDING COLUMNS EMPLOYEE DOB AND EMPLOYEE DOJ

ALTER TABLE employee
ADD employeeDOB date,employeeDOJ date;


--CREATING TABLE EMPLOYEE SALARY DETAILS

IF exists (select 1 from sys.objects where name='EmployeeSalaryDtls' and type='u')
DROP TABLE EmployeeSalaryDtls;

CREATE TABLE EmployeeSalaryDtls(EmployeeID int,Salary Decimal(18,2) default null
								,Month int default null
								,Year int default null);

IF exists (select 1 from sys.objects where name='FK_EmployeeSalaryDtls_EmployeeID' and type='f')
ALTER table EmployeeSalaryDtls
DROP CONSTRAINT FK_EmployeeSalaryDtls_EmployeeID;

ALTER TABLE EmployeeSalaryDtls
ADD CONSTRAINT FK_EmployeeSalaryDtls_EmployeeID foreign key(EmployeeID)
REFERENCES employee(EmployeeID);



--TO FIND MAXIMUM SALARY


SELECT max(Salary)
FROM EmployeeSalaryDtls


--TO FIND AVERAGE SALARY


SELECT AVG(Salary)AS 'Average salary'
FROM EmployeeSalaryDtls;


--TO FIND SECOND HIGHEST SALARY

SELECT * from(
SELECT EmployeeID,Salary,DENSE_RANK() OVER (ORDER BY Salary desc) AS DenseRank
FROM EmployeeSalaryDtls) as a
WHERE DenseRank=2;


--CREATING TABLE TBL _DATE

IF exists (select 1 from sys.objects where name='Tbl_Date' and type='u')
DROP TABLE Tbl_Date;

CREATE TABLE Tbl_Date(ID int identity(1,1)
						,Day int not null
						,Month Varchar(50) not null
						,Year int not null);


ALTER TABLE Tbl_Date
ADD date datetime;



--TO INSERT VALUES BETWEEN THE PERIOD 2012-01-01 AND 2014-12-31

DECLARE @startdate datetime
DECLARE @enddate datetime
SET @startdate='2012-01-01'
SET @enddate='2014-12-31'

WHILE @startdate <= @enddate

BEGIN

			INSERT INTO Tbl_Date(Day
								,Month
								,Year
								,date)
			VALUES(day(@startdate)
						,datename(month,@startdate)
						,year(@startdate),@startdate);
			SET @startdate=dateadd(day,1,@startdate);

END

select * from Tbl_Date

