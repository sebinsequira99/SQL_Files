


insert into rptfilters(
ReportID
,FieldName
,DisplayText
,FieldType
,DefaultValue
,EndRange
,sequence
,LookUpId)

select -62	,'A.[Program Type]',	'Program Type',	8,	'',	NULL,	1,	41
union
select -62	,'A.[Group]','Group',	8,	'',	NULL,	2,	40
union
select -62	,'A.[Secure Case Note Type]',	'Secure Case Note Type',	8,	'',	NULL,	3,	43
union
select -62	,'A.[Secure Case Note Sub-Type]',	'Secure Case Note Sub-Type',	8,	'',	NULL,	4,	42
union
select -62	,'A.[Case Worker]',	'Case Worker',	1,	'',	NULL,	5,	NULL

insert into lkplookuptable(
LkpName,	DisplayField,	ValueField,	Query,	Parameter)
select	'CounProgramTypes',	'CounProgramTypes',	'relationshiptypetext',	'SELECT DISTINCT relationshiptypetext as id,relationshiptypetext from rel_lkp_relationshiptype where RelationshipSubTypeId=32 ORDER BY relationshiptypetext ASC',	NULL
union
select	'CounGroups',	'CounGroups',	'group_name',	'SELECT DISTINCT group_name as id,group_name from user_groups where grouprole_sub_type_id=32 ORDER BY group_name ASC',	NULL
union
select	'CounSecureCaseNoteTypes',	'CounSecureCaseNoteTypes',	'acttypetext',	'SELECT DISTINCT acttypetext as id,acttypetext from lkpacttype where isSecure=1 and programID=32 ORDER BY acttypetext ASC',	NULL
union
select	'CounSecureCaseNoteSubTypes',	'CounSecureCaseNoteSubTypes',	'Description',	'SELECT DISTINCT Description as id,Description from lkpsecurecasenotesubtypes where subtypeid in(select distinct SecureNoteSubTypeID from securecasenotesubtypes where SecureNoteTypeID in(select acttypeid from lkpacttype where isSecure=1 and programID=32)) ORDER BY Description ASC',	NULL




