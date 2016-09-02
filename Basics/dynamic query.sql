

--DYNAMIC QUERY
--=======================

--CREATING MULTIPLE DATABASES


CREATE DATABASE testdb3
USE testdb3

IF exists (select 1 from sys.objects where name='tbl_fruits' and type='u')
DROP TABLE tbl_fruits;

CREATE TABLE tbl_fruits(fruitid int not null,
						fruitname Varchar(200),
						colour Varchar(200));


INSERT INTO tbl_fruits 
VALUES  (1,'apple','red'),
		(2,'orange','orange'), 
        (3,'grapes','green'),
		(4,'banana','yellow'),
        (5,'pomengranate','red');


CREATE DATABASE testdb4
USE testdb4

IF exists (select 1 from sys.objects where name='dynamictable' and type='u')
DROP TABLE dynamictable;

CREATE TABLE dynamictable(databaseID int,
							databasename varchar(20));

INSERT INTO dynamictable(databaseID,
							databasename)
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

