



mapsdc..user_accounts where user_type='agency'

user_agencies

rel_relationship where displayname like '%search%'
rel_relationship where displayname like '%mouse, mickey%'

rel_relationship where ConnectionId=579164

rel_relationship where contactid=172774

update rel_relationship
set contactid2=null
where RelationshipID=579165

select COALESCE([dbo].udf_CoupleContactId(-172763,1),0) 

usp_clientsearch

sys.objects where name like '%sp_%connection%' and type='p'

SET ANSI_NULLS ON SET ANSI_PADDING ON SET QUOTED_IDENTIFIER ON SET ANSI_WARNINGS ON 
SET CONCAT_NULL_YIELDS_NULL ON SET ARITHABORT ON SET ANSI_NULL_DFLT_ON ON 
EXEC SP_ContactInsert 196,'test ','','hyhy','','','M','','','','','','','','','','26','','0','','','','',0,'', '','','','',''

--EXEC SP_AddNewConnection  '196', '0' ,  '-172767' ,  default,'2016-05-26 03:08:05  AM','Person',default

--	@CAccountKey varchar(100)= '0',
--	@ConnectionId int = 0,  
--	@ConnID int = 0,  
--	@RelLabel varchar(250) = '',  
--	@RelDate varchar(25) = '',  
--	@RelTypeID varchar(100) = '0',
--	@MemberSeq int = -1,
--	@RelEndDate varchar(25) = '',
--	@Userid INT = 0,
--	@loginUserid INT = 0
	
	--EXEC SP_CoupleConnection '579164', '-172763' ,'-3001', '-172825','-3001','1'

	--exec SP_AddNewConnection 196,579164,-172776,default,default,-3001,default
	
