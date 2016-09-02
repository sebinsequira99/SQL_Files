

use mapdev

sp_helptext SP_lkpActType

Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SP_lkpActType]
	   
	   @CAccountKey varchar(100)= ' ',
	   @TaskType varchar(6) = null,
	   @ActTypeId int =0,
	   @ActTypeText varchar(100) = '',
	   @isOutReach bit = 0,
	   @isDurationCount bit =0,
	   @isActive bit =1,
	   @isSecure bit = 0,
	   @programID int = 0
	   

AS

Declare	@SqlQry nvarchar(2500);

BEGIN
	   DECLARE @strDBName VARCHAR(MAX)
	   	   	   
	   /* finding agency according to CAccountKey*/

	   IF ( @CAccountKey <>'' AND ISNUMERIC(@CAccountKey)=1)
 
		BEGIN 
			 SELECT  DISTINCT @strDBName= '['+[DBName]+']' 
			 FROM [IrrisCentral].[dbo].[lutPrimaryAgency] 
			 WHERE SiteID=@CAccountKey
		END
		
	IF (@strDBName is not null)
		
	BEGIN
		
		-- To retrieve list 
		IF(@TaskType = 'List')
			BEGIN
				
				SET @SqlQry='SELECT
				 	[ActTypeId],
				 	[ActTypeText],
				 	[isOutReach],
				 	[isDurationCount],
				 	[isActive],
				 	[isSecure],
				 	[programID]
				 	
				 FROM
					'+@strDBName+'.[dbo].[lkpActType]';
				--It will return single row when id is not null
				--IF( @ActTypeId  '' OR @ActTypeId  null OR @ActTypeId  0)
				IF( @ActTypeId <> 0)
				BEGIN
					 SET @SqlQry= @SqlQry + ' WHERE ActTypeId='+cast(@ActTypeId as varchar(5));

				END
				EXEC(@SqlQry);	

			END
		
		-- To insert record
		ELSE IF(@TaskType = 'Insert')
			BEGIN
			SET NOCOUNT ON
				SET @SqlQry= 'INSERT INTO '+@strDBName+'.[dbo].[lkpActType]
					( ActTypeText, isOutReach, isDurationCount, isActive,isSecure,programID)
					 VALUES 
					('''+@ActTypeText +''','+cast(@isOutReach as varchar(5))+','+cast(@isDurationCount as varchar(5))+' ,'+ cast(@isActive as varchar(5))+' ,'+ cast(@isSecure as varchar(5))+' ,'+ cast(@programID as varchar(5))+' )';
				 --print @SqlQry;
				 EXEC(@SqlQry);
				 Select @ActTypeId = @@identity;
				 Select @ActTypeId as ActTypeId
		SET NOCOUNT Off
			END
		
		
		-- TO update records
		 ELSE IF(@TaskType = 'Update')
			BEGIN
				SET @SqlQry= 'UPDATE '+ @strDBName +'.[dbo].[lkpActType]
					SET
						ActTypeText = ''' + @ActTypeText+ ''',
						isOutReach = '+ cast(@isOutReach as varchar(5))+',
						isDurationCount =' + cast( @isDurationCount  as varchar(5))+',
						isActive ='+ cast(@isActive  as varchar(5))+',
						isSecure ='+ cast(@isSecure  as varchar(5))+',
						programID ='+ cast(@programID  as varchar(5))+'
						
					WHERE ActTypeId ='+ cast(@ActTypeId as varchar(5));
				EXEC(@SqlQry);
			END
		
		-- To delete a record
		ELSE IF(@TaskType = 'Delete')
			BEGIN
				EXEC ('DELETE FROM '+@strDBName+'.[dbo].[lkpActType] WHERE ActTypeId='+@ActTypeId);
			END


	END
		
	 
		
END




