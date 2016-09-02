
--=============================================--
CREATE TABLE testtbl(name varchar(20))

INSERT INTO testtbl(name)
VALUES('a'),('a'),('a'),('b'),('b'),('c')

SELECT * FROM testtbl


ALTER TABLE testtbl ADD  sno int identity(1,1)
DELETE FROM testtbl WHERE sno in
(
SELECT sno  from testtbl D WHERE 
1<(SELECT count(*) from testtbl A WHERE A.name=D.name and D.sno>=A.sno)
)

ALTER TABLE testtbl
DROP COLUMN sno

SELECT * FROM testtbl  
   
drop table testtbl
--===============================================--

;WITH TempEmp (Name,duplicateRecCount)
AS
(
SELECT Name,ROW_NUMBER() OVER(PARTITION by Name ORDER BY Name) 
AS duplicateRecCount
FROM testtbl
)
--Now Delete Duplicate Records
DELETE FROM TempEmp
WHERE duplicateRecCount > 1 
 --See affected table
Select * from testtbl

