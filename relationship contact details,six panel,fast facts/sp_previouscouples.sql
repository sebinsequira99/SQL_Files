
user_agencies
rel_relationship

DECLARE
	   @CAccountKey varchar(100)= '211',
	   @ConnId int = 1,
	   @CurrentCoupleConnectionId int = 1

Declare	@RunSql nvarchar(2000),
			@ParamDef  nvarchar(1000),
			@strDBName VARCHAR(MAX)

/* finding agency according to CAccountKey*/
IF ( @CAccountKey <>'' AND ISNUMERIC(@CAccountKey)=1)
	BEGIN 
		 SELECT  DISTINCT @strDBName= '['+[DBName]+']' 
		 FROM [IrrisCentral].[dbo].[lutPrimaryAgency] 
		 WHERE SiteID=@CAccountKey
	END
	
IF (@strDBName is not null)
	BEGIN
		SET @RunSql= 'Select r.ConnectionId as CoupleConnectionId,
							' + @strDBName + '.dbo.udf_CoupleName(r.ConnectionId,1,'''',Default,Default,Default) as CoupleName
						from ' + @strDBName + '.dbo.Rel_Relationship r
						inner join ' + @strDBName + '.dbo.Rel_lkp_RelationshipType rt on r.RelationshipTypeId = rt.RelationshipTypeId
						where r.ConnId = ' + cast(@ConnId as varchar(1000)) + '
							and rt.RelationshipSubTypeId in (-3,0)
							and r.connectionId <> ' + cast(@ConnId as varchar(1000)) + '
							and r.connectionId <> ' + cast(@CurrentCoupleConnectionId as varchar(1000)) + '
						order by RelationshipDateLastUpdated desc'
						
		Print  @RunSql
		--EXEC (@RunSql)
		
	END

	Select r.ConnectionId as CoupleConnectionId,
			[Rolesqa].dbo.udf_CoupleName(271901,1,'',Default,Default,Default) as CoupleName,*
	from [Rolesqa].dbo.Rel_Relationship r
	inner join [Rolesqa].dbo.Rel_lkp_RelationshipType rt on r.RelationshipTypeId = rt.RelationshipTypeId
	where 
	r.ConnId = -79587
	and 
	rt.RelationshipSubTypeId in (-3,0)
	and r.connectionId <> -79587
	and r.connectionId <> 271901
	order by CoupleConnectionId,RelationshipDateLastUpdated desc

Rel_lkp_RelationshipsubType where RelationshipSubTypeId=-3
	;with rel as (select row_number() over(partition by connid order by connid) as dup,* from rel_relationship)
	select * from rel r
	inner join [Rolesqa].dbo.Rel_lkp_RelationshipType rt on r.RelationshipTypeId = rt.RelationshipTypeId
	where dup>2 and 
	rt.RelationshipSubTypeId in (-3,0)

rel_relationship where connid=-79587

rel_relationship  where connectionid in (230329
,272416
,272418
,251055
,251057)

rel_relationship  where connectionid in (
90746
,90748
,290568
,290570)



maplmi
rel_relationship where displayname in ('Barrett, Daleea','Barrett, Daleea &amp; Jeremy','Barrett, Jeremy')


select connid,RelationshipTypeId,* from rel_relationship r
where RelationshipTypeId in (-3001,-3002,-3003,-3004,-3005)
order by r.connid

use maplmi
select r.displayname,rt.RelationshipTypetext,* from rel_relationship r 
join Rel_lkp_RelationshipType rt
on r.RelationshipTypeId=rt.RelationshipTypeId
where r.connid=-539

select * from rel_relationship where contactid=539


select * from rel_lkp_relationshiptype where RelationshipTypeId in (
-10
,-12
,-30)

