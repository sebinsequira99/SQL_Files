

--CREATING VIEW OF TABLE EMPLOYEE

IF exists (select 1 from sys.objects where name='viewdetails' and type='v')
DROP VIEW viewdetails;

CREATE VIEW viewdetails 
AS
SELECT EmployeeID,
		EmployeeFirstName,
		EmployeeLastName,
		EmployeeMiddleName,
		EmailID,
		MobileNumber,
		designation,
		isdeleted,
		companyid
FROM Employee where Isdeleted=0;

SELECT EmployeeID,
		EmployeeFirstName,
		EmployeeLastName,
		EmployeeMiddleName,
		EmailID,
		MobileNumber,
		designation,
		isdeleted,
		companyid
FROM viewdetails;
