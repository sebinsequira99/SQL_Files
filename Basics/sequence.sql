


--drop SEQUENCE CountBy1
--drop TABLE TestTable

CREATE SEQUENCE CountBy1
    START WITH 1
    INCREMENT BY 1 ;
GO

CREATE TABLE TestTable
     (CounterColumn int PRIMARY KEY,
      Name nvarchar(25) NOT NULL) ; 
GO

INSERT INTO TestTable(CounterColumn,Name)
VALUES (NEXT VALUE FOR CountBy1, 'a'),(NEXT VALUE FOR CountBy1, 'a'),(NEXT VALUE FOR CountBy1, 'a')
,(NEXT VALUE FOR CountBy1, 'a')
GO

SELECT * FROM TestTable; 
GO
