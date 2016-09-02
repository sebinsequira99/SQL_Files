
--exec usp_UpdateAgeDetails '2015-01-01',102764

-- =============================================================================================
-- Created date: 20/01/16
-- Description:	Update Age and Actual Age(ActAge) library fields in library_systemdata table 
--				when DOB is changed in contact table
-- =============================================================================================

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_UpdateAgeDetails' AND type='p')
DROP PROCEDURE usp_UpdateAgeDetails;
GO

CREATE PROC usp_UpdateAgeDetails
(
 @BirthDate datetime
,@ContactId int 
)
AS 
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @xmldata_system xml
		   ,@inputfieldname varchar(200)
		   ,@inputfieldname_act varchar(200)
		   ,@inputfieldvalue varchar(200)
		   ,@inputfieldvalue_act varchar(200)
		   ,@thisYearBirthDay datetime
		   ,@years int
		   ,@months int
		   ,@days int
		   ,@SqlVar nvarchar(max)
		   ,@SqlVar1 nvarchar(max)

	SELECT @xmldata_system=data_xml from library_systemdata 
						   where contactid=@ContactId
	;
	WITH xmlData_system
	AS 
	(
	SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'SystemFieldname'
	,[column].value('.', 'NVARCHAR(max)') as 'SystemFieldvalue'
	FROM @xmldata_system.nodes('//.') as [table]([column])
	WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
	)

	SELECT * into #xmlData_system FROM xmlData_system


	IF(ISNULL(@BirthDate,'')<>'' AND @BirthDate <> '1900-01-01 00:00:00.000')
	BEGIN
		SELECT @inputfieldvalue=DATEDIFF(yy, @BirthDate, getdate())

		SET @thisYearBirthDay = DATEADD(YEAR, DATEDIFF(YEAR, @BirthDate, GETDATE()), @BirthDate)
		SET @years = DATEDIFF(YEAR, @BirthDate, GETDATE()) - (CASE WHEN @thisYearBirthDay > GETDATE() THEN 1 ELSE 0 END)
		SET @months = MONTH(GETDATE() - @thisYearBirthDay) - 1
		SET @days = DAY(GETDATE() - @thisYearBirthDay) - 1

		SELECT @inputfieldvalue_act=CAST(@years AS VARCHAR(2)) + ' Years ' + CAST(@months AS VARCHAR(2)) + ' Months ' + CAST(@days AS VARCHAR(3)) + ' Days'
	END


	SELECT @inputfieldname=systemfieldname from #xmldata_system where systemfieldname='AP1Age'
	
	IF(@inputfieldname is not null)

	BEGIN

		Set @SqlVar = '''delete /Library/'+@inputfieldname+'[1]'''

		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))

		Print @SqlVar1
		Execute (@SqlVar1)

		Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/Library)[1]'''

		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))

		Print @SqlVar1
		Execute (@SqlVar1)

	END

	ELSE

	BEGIN

		set @inputfieldname='AP1Age'

		Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/Library)[1]'''

		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))

		Print @SqlVar1
		Execute (@SqlVar1)

	END

	SELECT @inputfieldname_act=systemfieldname from #xmldata_system where systemfieldname='AP1ActAge'
	
	IF(@inputfieldname_act is not null)

	BEGIN

		Set @SqlVar = '''delete /Library/'+@inputfieldname_act+'[1]'''

		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))

		Print @SqlVar1
		Execute (@SqlVar1)

		Set @SqlVar = '''insert <'+@inputfieldname_act+'>'+@inputfieldvalue_act+'</'+@inputfieldname_act+'> into (/Library)[1]'''

		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))

		Print @SqlVar1
		Execute (@SqlVar1)

	END

	ELSE

	BEGIN

		set @inputfieldname_act='AP1ActAge'

		Set @SqlVar = '''insert <'+@inputfieldname_act+'>'+@inputfieldvalue_act+'</'+@inputfieldname_act+'> into (/Library)[1]'''

		--Print @SqlVar

		Set @SqlVar1 = 'UPDATE library_systemdata
		SET data_xml.modify('+@SqlVar+')
		where contactid='+cast(@contactid as varchar(10))

		Print @SqlVar1
		Execute (@SqlVar1)

	END

	DROP TABLE #xmldata_system

END


