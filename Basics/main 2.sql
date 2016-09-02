


USE testdb2

IF exists (select 1 from sys.objects where name='tbl_fruits' and type='u')
DROP TABLE tbl_fruits;

CREATE TABLE tbl_fruits(fruitid int not null
						,fruitname Varchar(200)
						,colour Varchar(200));

IF exists (select 1 from sys.objects where name='tbl_month' and type='u')
DROP TABLE tbl_month;

CREATE TABLE tbl_month(monthid int not null
						,month_name Varchar(200)
						,fruitid Int);

IF exists (select 1 from sys.objects where name='sales' and type='u')
DROP TABLE sales;

CREATE TABLE sales(salesID int identity(1,1) not null
					,salesitem Varchar(200)
					,saleslist Varchar(200)
					,salesstatus Varchar(200)
					,fruitid Int);

IF exists (select 1 from sys.objects where name='tbl_transaction' and type='u')
DROP TABLE tbl_transaction;

CREATE TABLE tbl_transaction(transactionid int not null
								,fruitname Varchar(200)
								,colour Varchar(200)
								,price int
								,fruitid Int);

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
VALUES  (1,'apple','red')
		,(2,'orange','orange')
		,(3,'grapes','green')
		,(4,'banana','yellow')
		,(5,'pomengranate','red');

INSERT INTO tbl_month 
VALUES   (1,'january',1)
		,(2,'february',2)
		,(3,'march',3)
		,(4,'february',4)
		,(5,'may',5);

INSERT INTO tbl_transaction
VALUES  (1,'apple','red',100,1)
		,(2,'orange','orange',150,2)
		,(3,'grapes','green',75,3)
		,(4,'banana','yellow',200,4)
		,(5,'pomengranate','red',150,5);



--JOIN FUNCTION (to display fruitname from table(tbl_fruits) and price from table(tbl_transaction) for a month)
--================================================================================================================


SELECT f.fruitname,t.price
FROM tbl_fruits f 
JOIN tbl_month AS m
ON f.fruitid = m.fruitid
JOIN tbl_transaction t
ON m.fruitid=t.fruitid
WHERE m.month_name = 'february';



--CLUSTERED INDEX CREATION
--==============================

IF EXISTS (SELECT name FROM sys.indexes
            WHERE name = 'IX_tbl_month_monthid')
    DROP INDEX IX_tbl_month_monthid ON tbl_month;

CREATE CLUSTERED INDEX IX_tbl_month_monthid
    ON tbl_month(monthid);


SELECT(isnull(fruitid,0))
FROM tbl_fruits



--CASE WHEN THEN END
--=========================

SELECT price
		,fruitname
		,comment = 
CASE 
		WHEN price = 100 THEN 'equal to 100'
		WHEN price < 100 THEN 'Under 100'
		WHEN price > 100 and price < 200 THEN 'Under 200'
		WHEN price >= 200 and price <= 350 THEN 'Under 350'
		ELSE 'Over 350'
END
FROM tbl_transaction
ORDER BY fruitname ;



--GROUP BY CLAUSE ( to display fruitid and sum of price for a particular colour of fruits)
--==========================================================================================


SELECT fruitid,
		(SELECT sum(price) 
FROM tbl_transaction  
GROUP BY colour
having colour='red') 
AS sum 
FROM tbl_fruits 
WHERE colour='red';



--TO INSERT VALUES INTO AN IDENTITY COLUMN
--===============================================

INSERT INTO sales(salesitem
					,saleslist
					,salesstatus
					,fruitid)
VALUES('a','b','c',1)
		,('d','e','f',2)
		,('g','h','i',3);

SELECT salesid
		,salesitem
		,saleslist
		,salesstatus
		,fruitid
FROM sales

--CREATE A GAP IN THE IDENTITY COLUMN

DELETE FROM sales 
WHERE salesitem='d';

-- SET IDENTITY_INSERT to ON.

SET IDENTITY_INSERT sales ON;


-- TRY TO INSERT AN EXPLICIT ID VALUE OF 2

INSERT INTO sales (salesid
					,salesitem
					,saleslist
					,salesstatus
					,fruitid) 
VALUES (2,'d','e','f',2);


