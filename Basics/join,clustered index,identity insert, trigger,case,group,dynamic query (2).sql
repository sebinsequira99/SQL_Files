

USE testdb2

IF exists (select 1 from sys.objects where name='tbl_fruits' and type='u')
DROP TABLE tbl_fruits;

CREATE TABLE tbl_fruits(fruitid int not null,
						fruitname Varchar(200),
						colour Varchar(200));

IF exists (select 1 from sys.objects where name='tbl_month' and type='u')
DROP TABLE tbl_month;

CREATE TABLE tbl_month(monthid int not null,
						month_name Varchar(200),
						fruitid Int);

IF exists (select 1 from sys.objects where name='sales' and type='u')
DROP TABLE sales;

CREATE TABLE sales(salesID int identity(1,1) not null,
						salesitem Varchar(200),
						saleslist Varchar(200),
						salesstatus Varchar(200),
						fruitid Int);

IF exists (select 1 from sys.objects where name='tbl_transaction' and type='u')
DROP TABLE tbl_transaction;

CREATE TABLE tbl_transaction(transactionid int not null,
						monthid Varchar(200),
						month_name Varchar(200),
						price int,
						fruitid Int);

--ADDING PRIMARY KEYS
--========================

IF exists (select 1 from sys.objects where name='PK_tbl_fruits_fruitid' and type='pk')
ALTER table tbl_fruits
DROP constraint PK_tbl_fruits_fruitid;

ALTER TABLE tbl_fruits
ADD CONSTRAINT PK_tbl_fruits_fruitid primary key(fruitid);

IF exists (select 1 from sys.objects where name='PK_tbl_month_monthid' and type='pk')
ALTER table tbl_month
DROP constraint PK_tbl_month_monthid;

ALTER TABLE tbl_month
ADD CONSTRAINT PK_tbl_month_monthid primary key(monthid);

IF exists (select 1 from sys.objects where name='PK_sales_salesID' and type='pk')
ALTER table sales
DROP constraint PK_sales_salesID;

ALTER TABLE sales
ADD CONSTRAINT PK_sales_salesID primary key(salesID);

IF exists (select 1 from sys.objects where name='PK_tbl_transaction_transactionid' and type='pk')
ALTER table tbl_transaction
DROP constraint PK_tbl_transaction_transactionid;

ALTER TABLE tbl_transaction
ADD CONSTRAINT PK_tbl_transaction_transactionid primary key(transactionid);


INSERT INTO tbl_fruits 
VALUES (1,'apple','red'),
		(2,'orange','orange'), 
        (3,'grapes','green'),
		(4,'banana','yellow'),
        (5,'pomegranate','red');

INSERT INTO tbl_month 
VALUES (1,'january',1),
		 (2,'february',2), 
		 (3,'march',3),
		 (4,'april',4),
         (5,'may',5);

INSERT INTO tbl_transaction
VALUES(1,1,'january',100,1),
		(2,2,'january',100,2),
		(3,3,'january',100,3),
		(4,4,'january',100,4),
		(5,5,'january',100,5);



--JOIN 
--==================

select * from tbl_fruits
select * from tbl_month
DELETE FROM tbl_fruits
FROM tbl_fruits AS c
    INNER LOOP JOIN tbl_month AS o
    ON c.fruitid = o.fruitid
WHERE o.monthid > 3;



--CLUSTERED INDEX CREATION
--==============================

IF EXISTS (SELECT name FROM sys.indexes
            WHERE name = 'IX_tbl_month_monthid')
    DROP INDEX IX_tbl_month_monthid ON tbl_month;

CREATE CLUSTERED INDEX IX_tbl_month_monthid
    ON tbl_month(monthid);


SELECT(isnull(fruitid,0))
FROM company



--CASE WHEN THEN END
--=========================

SELECT fruitid, fruitname, price = 
CASE 
		WHEN fruitid = 50 THEN 'equal to 50'
		WHEN fruitid < 50 THEN 'Under 50'
		WHEN fruitid > 50 and fruitid < 150 THEN 'Under 150'
		WHEN fruitid >= 150 and fruitid <= 350 THEN 'Under 350'
		ELSE 'Over 350'
END
FROM tbl_fruits
ORDER BY fruitid ;



--GROUP BY CLAUSE
--======================


SELECT fruitid,
(SELECT sum(fruitid) 
FROM tbl_fruits 
WHERE tbl_fruitsMiddleName='c' 
GROUP BY tbl_fruitsMiddleName) 
AS sum 
FROM tbl_fruits 
WHERE tbl_fruitsMiddleName='c';



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
		IF (@deleteyn=0 AND @emp=0)

			INSERT INTO emp(empid,
							empname)
			VALUES(@empid,
					@empname);

		ELSE IF (@deleteyn=0 AND @emp=1)

				UPDATE emp
				SET empid=@empid,
					empname=@empname
				WHERE empid=@empid;

		ELSE IF (@deleteyn=1)

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

IF exists (select 1 from sys.objects where name='tbl_fruits' and type='u')
DROP TABLE tbl_fruits;

CREATE TABLE tbl_fruits(fruitid int not null,
						fruitname Varchar(200),
						colour Varchar(200),
						tbl_fruitsMiddleName Varchar(200),
						fruitid Int);


INSERT INTO tbl_fruits 
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

INSERT INTO dynamictable(databaseID,databasename)
VALUES(1,'testdb2'),
		(2,'testdb3');

DECLARE @dbid int; 
DECLARE @dbcount int;
DECLARE @dbname varchar(100);
DECLARE @dynamicquery varchar(100);
SET @dbid = 1;
SELECT @dbcount=COUNT('databaseID')
FROM dynamictable;

WHILE  @dbid <= @dbcount
BEGIN
		SELECT @dbname=databasename 
		FROM dynamictable 
		WHERE databaseid=@dbid ;
		SET @dbid=@dbid+1;
		SET @dynamicquery=' select * from ' + @dbname + '.dbo.tbl_fruits';
		EXEC(@dynamicquery);
END



--TO INSERT VALUES INTO AN IDENTITY COLUMN
--===============================================

INSERT INTO sales(salesitem,saleslist,salesstatus,fruitid)
VALUES('a','b','c',1),
		('d','e','f',2),
		('g','h','i',3);

SELECT salesid,
		salesitem,
		saleslist,
		salesstatus,
		fruitid
FROM sales

--CREATE A GAP IN THE IDENTITY COLUMN

DELETE FROM sales 
WHERE salesitem='d';

-- SET IDENTITY_INSERT to ON.

SET IDENTITY_INSERT sales ON;


-- TRY TO INSERT AN EXPLICIT ID VALUE OF 2

INSERT INTO sales (salesid,
					salesitem,
					saleslist,
					salesstatus,
					fruitid) 
VALUES (2,'d','e','f',2);



--TRIGGER CREATION
--======================

IF exists (select 1 from sys.objects where name='tr_tbl_fruits' and type='tr')
DROP TRIGGER tr_tbl_fruits;
GO
CREATE TRIGGER tr_tbl_fruits
ON tbl_fruits
AFTER INSERT, UPDATE 
AS RAISERROR ('error message', 16, 10);
GO




