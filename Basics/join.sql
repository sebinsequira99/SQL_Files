--CREATED BY SEBIN SEQUIRA
--CREATED ON 28-11-14


USE testdb2

IF exists (select 1 from sys.objects where name='customer' and type='u')
DROP TABLE customer;

CREATE TABLE customer(customerID int not null,
						customerFirstName Varchar(200),
						customerLastName Varchar(200),
						customerMiddleName Varchar(200),
						companyid Int);

IF exists (select 1 from sys.objects where name='orders' and type='u')
DROP TABLE orders;

CREATE TABLE orders(orderID int not null,
						orderitem Varchar(200),
						ordercost Varchar(200),
						orderstatus Varchar(200),
						companyid Int);

IF exists (select 1 from sys.objects where name='sales' and type='u')
DROP TABLE sales;

CREATE TABLE sales(salesID int identity(1,1) not null,
						salesitem Varchar(200),
						saleslist Varchar(200),
						salesstatus Varchar(200),
						companyid Int);

IF exists (select 1 from sys.objects where name='employees' and type='u')
DROP TABLE employees;

CREATE TABLE employees(EmployeeID int not null,
						EmployeeFirstName Varchar(200),
						EmployeeLastName Varchar(200),
						EmployeeMiddleName Varchar(200),
						EmailID Varchar(100),
						MobileNumber Varchar(9),
						designation Varchar(50),
						isdeleted Bit default 0,
						companyid Int);

--ADDING PRIMARY KEYS
--========================

IF exists (select 1 from sys.objects where name='PK_customers_customerID' and type='pk')
ALTER table customer
DROP constraint PK_customers_customerID;

ALTER TABLE customer
ADD CONSTRAINT PK_customers_customerID primary key(customerID);

IF exists (select 1 from sys.objects where name='PK_orders_orderID' and type='pk')
ALTER table orders
DROP constraint PK_orders_orderID;

ALTER TABLE orders
ADD CONSTRAINT PK_orders_orderID primary key(orderID);

IF exists (select 1 from sys.objects where name='PK_sales_salesID' and type='pk')
ALTER table sales
DROP constraint PK_sales_salesID;

ALTER TABLE sales
ADD CONSTRAINT PK_sales_salesID primary key(salesID);

IF exists (select 1 from sys.objects where name='PK_employees_EmployeeID' and type='pk')
ALTER table employees
DROP constraint PK_employees_EmployeeID;

ALTER TABLE employees
ADD CONSTRAINT PK_employees_EmployeeID primary key(EmployeeID);


INSERT INTO customer 
    VALUES (50,'a','b','c',100),
		   (200,'d','e','c',150), 
           (75,'h','i','j',10),
		   (20,'m','n','c',400),
           (400,'p','q','r',25);

INSERT INTO orders 
    VALUES (1,'a','b','c',1),
		   (2,'d','e','f',6), 
           (3,'h','i','j',7),
		   (4,'m','n','o',8),
           (5,'p','q','r',5);



--HASH JOIN
--==================



SELECT c.customerID, o.orderID
FROM customer AS c
LEFT OUTER HASH JOIN orders AS o
ON c.companyid = o.companyid
ORDER BY customerID ASC;


--LOOP JOIN
--===================


DELETE FROM customer
FROM customer AS c
    INNER LOOP JOIN orders AS o
    ON c.companyid = o.companyid
WHERE o.orderID > 3;


--MERGE JOIN
--==================


SELECT c.customerID, c.customerFirstName, c.customerLastName, c.customerMiddleName, c.companyid 
FROM customer AS c
INNER MERGE JOIN orders AS o 
ON c.companyid = o.companyid;




--CLUSTERED INDEX CREATION
--==============================

IF EXISTS (SELECT name FROM sys.indexes
            WHERE name = 'IX_orders_orderID')
    DROP INDEX IX_orders_orderID ON orders;

CREATE CLUSTERED INDEX IX_orders_orderID
    ON orders(orderID);


SELECT(isnull(companyid,0))
FROM company



--CASE WHEN THEN END
--=========================

SELECT customerID, customerFirstName, price = 
CASE 
		WHEN customerID = 50 THEN 'equal to 50'
		WHEN customerID < 50 THEN 'Under 50'
		WHEN customerID > 50 and customerID < 150 THEN 'Under 150'
		WHEN customerID >= 150 and customerID <= 350 THEN 'Under 350'
		ELSE 'Over 350'
END
FROM customer
ORDER BY customerID ;



--GROUP BY CLAUSE
--======================


SELECT customerid,
(SELECT sum(companyid) 
FROM customer 
WHERE customerMiddleName='c' 
GROUP BY customerMiddleName) 
AS sum 
FROM customer 
WHERE customerMiddleName='c';



--PROCEDURE TO INSERT,UPDATE AND DELETE VALUES WITHOUT USING MERGE
--======================================================================

IF exists (select 1 from sys.objects where name='emp' and type='u')
DROP TABLE emp;

CREATE table emp(empid int not null,
					empname varchar(20)); 




IF exists (select 1 from sys.objects where name='usp_ins_upd_del' and type='p')
DROP PROCEDURE usp_ins_upd_del;

CREATE PROCEDURE usp_ins_upd_del(@emp bit,
									@empid int,
									@empname varchar(20),
									@deleteyn bit)
AS
BEGIN
		IF(@deleteyn=0 AND @emp=0)
		INSERT INTO emp(empid,
						empname)
		VALUES(@empid,@empname);
		ELSE IF (@deleteyn=0 AND @emp=1)
		UPDATE emp
		SET empid=@empid,empname=@empname
		WHERE empid=@empid;
		ELSE IF(@deleteyn=1)
		DELETE FROM emp
		WHERE empid=@empid
END

EXEC usp_ins_upd_del
					@emp=0,
					@empid=2,
					@empname='b',
					@deleteyn=0;

SELECT empid,empname 
FROM emp



--DYNAMIC QUERY
--=======================

CREATE DATABASE testdb3
USE testdb3

IF exists (select 1 from sys.objects where name='customer' and type='u')
DROP TABLE customer;

CREATE TABLE customer(customerID int not null,
						customerFirstName Varchar(200),
						customerLastName Varchar(200),
						customerMiddleName Varchar(200),
						companyid Int);


INSERT INTO customer 
VALUES (1,'a','b','c',1),
		(2,'d','e','c',2), 
        (3,'h','i','j',3),
		(4,'m','n','c',4),
        (5,'p','q','r',5);


CREATE DATABASE testdb4
USE testdb4

IF exists (select 1 from sys.objects where name='dynamictable' and type='u')
DROP TABLE dynamictable;

CREATE TABLE dynamictable(databaseID int,
							databasename varchar(20));

insert into dynamictable(databaseID,databasename)
values(1,'testdb2'),
		(2,'testdb3');

DECLARE @dbid int; 
DECLARE @dbcount int;
DECLARE @dbname varchar(100);
DECLARE @dynamicquery varchar(100);
SET @dbid = 1;
select @dbcount=COUNT('databaseID')
				from dynamictable;

WHILE  @dbid <= @dbcount
begin
		select @dbname=databasename from dynamictable where databaseid=@dbid ;
		set @dbid=@dbid+1;
		set @dynamicquery=' select * from ' + @dbname + '.dbo.customer';
		exec(@dynamicquery);
end



--TO INSERT VALUES INTO AN IDENTITY COLUMN
--===============================================

INSERT INTO sales(salesitem,saleslist,salesstatus,companyid)
VALUES('a','b','c',1),
		('d','e','f',2),
		('g','h','i',3);

SELECT salesid,
		salesitem,
		saleslist,
		salesstatus,
		companyid
FROM sales

--Create a gap in the identity column

DELETE FROM sales 
WHERE salesitem='d';

-- SET IDENTITY_INSERT to ON.

SET IDENTITY_INSERT sales ON;


-- Try to insert an explicit ID value of 2
INSERT INTO sales (salesid,salesitem,saleslist,salesstatus,companyid) VALUES (2,'d','e','f',2);



--TRIGGER CREATION
--======================

IF exists (select 1 from sys.objects where name='tr_customer' and type='tr')
DROP TRIGGER tr_customer;
GO
CREATE TRIGGER tr_customer
ON customer
AFTER INSERT, UPDATE 
AS RAISERROR ('error message', 16, 10);
GO




