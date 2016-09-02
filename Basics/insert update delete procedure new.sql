



--PROCEDURE TO INSERT,UPDATE AND DELETE VALUES WITHOUT USING MERGE
--======================================================================

IF exists (select 1 from sys.objects where name='emp' and type='u')
DROP TABLE emp;

CREATE table emp(empid int not null,
					empname varchar(20)); 



IF exists (select 1 from sys.objects where name='usp_ins_upd_del' and type='p')
DROP PROCEDURE usp_ins_upd_del;



CREATE PROCEDURE usp_ins_upd_del(@empid int,
									@empname varchar(20),
									@deleteyn bit)
AS
BEGIN
 		
		   IF(@empid=(select empid from emp) and @deleteyn=0)

				BEGIN
						UPDATE emp
						SET empid=@empid,
							empname=@empname
						WHERE empid=@empid;
				END

			ELSE IF(@deleteyn=1)

				BEGIN
						DELETE FROM emp
						WHERE empid=@empid;	
				END

			ELSE

				BEGIN
						INSERT INTO emp(empid,
										empname)
						VALUES(@empid,
								@empname);
				END

				
		

END
	

EXEC usp_ins_upd_del
					@empid=3,
					@empname='b',
					@deleteyn=0;

SELECT empid,empname 
FROM emp