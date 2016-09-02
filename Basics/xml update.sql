	

	declare @inputfieldname varchar(100)
		   ,@inputfieldvalue varchar(100)

	set @inputfieldname='AP1Fname'
	set @inputfieldvalue='Faisal'

	Declare @SqlVar nvArchar(Max)
	Declare @SqlVar1 nvArchar(Max)

	Set @SqlVar = '''replace value of 
	(/Library/'+@inputfieldname+'/text())[1] with ("'+@inputfieldvalue+'")'''

	Print @SqlVar

	Set @SqlVar1 = 'UPDATE library_systemdata
	SET data_xml.modify('+@SqlVar+')
	where id=1'

	Print @SqlVar1
	Execute (@SqlVar1)

	Select * From library_systemdata Where id=1



		
	declare @inputfieldname varchar(100)
		   ,@inputfieldvalue varchar(100)

	set @inputfieldname='testing'
	set @inputfieldvalue='ss'

	Declare @SqlVar As nvArchar(Max)
	Declare @SqlVar1 As nvArchar(Max)

	Set @SqlVar = '''insert <'+@inputfieldname+'>'+@inputfieldvalue+'</'+@inputfieldname+'> into (/Library)[1]'''

	Print @SqlVar


	Set @SqlVar1 = 'UPDATE library_systemdata
	SET data_xml.modify('+@SqlVar+')
	where id=1'

	Print @SqlVar1
	Execute (@SqlVar1)

	Select * From library_systemdata Where id=1
