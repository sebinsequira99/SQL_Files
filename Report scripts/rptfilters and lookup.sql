


insert into rptfilters(
ReportID
,FieldName
,DisplayText
,FieldType
,DefaultValue
,EndRange
,sequence
,LookUpId)

select -63	,'ua.first_name+'' ''+ua.last_name',	'Caseworker Name',	1,	'',	NULL,	1,	NULL
union
select -63	,'FORMAT(ch.startdate,''yyyy-MM-dd'')','CW Start Date',	4,	'',	NULL,	2,	NULL
union
select -63	,'FORMAT(ch.enddate,''yyyy-MM-dd'')',	'CW End Date',	4,	'',	NULL,	3,	NULL
union
select -63	,'ch.activeyn',	'Current Caseworker',	8,	'',	NULL,	4,	45
union
select -63	,'replace(r.displayname,''amp;'','''')',	'Client Name',	1,	'',	NULL,	5,	NULL
union
select -63	,'ug.group_name',	'Group Name',	8,	'',	NULL,	6,	8
union
select -63	,'r.rellabel',	'Case Number',	1,	'',	NULL,	7,	NULL
union
select -63	,'rt.relationshiptypetext',	'Role',	8,	'',	NULL,	8,	7
union
select -63	,'rs.relationshipsubtypetext',	'Program',	8,	'',	NULL,	9,	6
union
select -63	,'ue.eff_status',	'CurrentGroup',	8,	'',	NULL,	10,	45
union
select -63	,'ls.stateabbreviation',	'State',	8,	'',	NULL,	10,	44


insert into lkplookuptable
(LkpName,	DisplayField,	ValueField,	Query,	Parameter)
select	'CounProgramTypes',	'CounProgramTypes',	'relationshiptypetext',	'SELECT DISTINCT relationshiptypetext as id,relationshiptypetext from rel_lkp_relationshiptype where RelationshipSubTypeId=32 ORDER BY relationshiptypetext ASC',	NULL
union
select	'CounGroups',	'CounGroups',	'group_name',	'SELECT DISTINCT group_name as id,group_name from user_groups where grouprole_sub_type_id=32 ORDER BY group_name ASC',	NULL
union
select	'CounSecureCaseNoteTypes',	'CounSecureCaseNoteTypes',	'acttypetext',	'SELECT DISTINCT acttypetext as id,acttypetext from lkpacttype where isSecure=1 and programID=32 ORDER BY acttypetext ASC',	NULL
union
select	'CounSecureCaseNoteSubTypes',	'CounSecureCaseNoteSubTypes',	'Description',	'SELECT DISTINCT Description as id,Description from lkpsecurecasenotesubtypes where subtypeid in(select distinct SecureNoteSubTypeID from securecasenotesubtypes where SecureNoteTypeID in(select acttypeid from lkpacttype where isSecure=1 and programID=32)) ORDER BY Description ASC',	NULL
