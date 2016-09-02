



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