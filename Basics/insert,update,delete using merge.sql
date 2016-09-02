
SELECT * from sys.objects

IF exists (select 1 from sys.objects where name='employeedetails' and type='u')
DROP TABLE employeedetails;

CREATE TABLE employeedetails (first_name varchar(20), middle_name varchar(20),
    last_name varchar(20));

INSERT INTO employeedetails 
    VALUES ('a','b','c'),
		   ('d','e','f'), 
           ('h','i','j'),
		   ('m','n','o'),
           ('p','q','r');

IF exists (select 1 from sys.objects where name='employeedetails_new' and type='u')
DROP TABLE employeedetails_new;

CREATE TABLE employeedetails_new (first_name varchar(20) NOT NULL PRIMARY KEY, middle_name nvarchar(30), 
    last_name nvarchar(50));

INSERT INTO employeedetails_new VALUES ('a','b','c'), 
										('d','e','g'),
										('z','k','l'),
										('m','n','o'), 
										('s','t','u'), 
										('v','w','x');

MERGE employeedetails AS old
USING employeedetails_new AS new
ON (old.first_name = new.first_name)
WHEN MATCHED AND old.last_name <> new.last_name OR old.middle_name <> new.middle_name
    THEN UPDATE SET old.last_name = new.last_name, old.middle_name = new.middle_name
WHEN NOT MATCHED THEN
    INSERT (first_name, middle_name, last_name)
        VALUES (new.first_name, new.middle_name, new.last_name)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE
OUTPUT $action,
       inserted.first_name AS Targetfirst_name, 
	   inserted.middle_name AS Targetmiddle_name, 
       inserted.last_name AS Targetlast_name, 
       deleted.first_name AS Sourcefirst_name, 
	   deleted.middle_name AS Sourcemiddle_name, 
       deleted.last_name AS Sourcelast_name;    

select * from employeedetails
