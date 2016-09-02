


mapat


INSERT INTO rptfilters
(
 ReportID
,FieldName
,DisplayText
,FieldType
,DefaultValue
,EndRange
,sequence
,LookUpId
)

SELECT ReportID
	  ,FieldName
	  ,DisplayText
	  ,FieldType
	  ,DefaultValue
	  ,EndRange
	  ,sequence
	  ,LookUpId

FROM rolesqa.dbo.rptfilters
WHERE reportid=-50


INSERT INTO rptFilters (
ReportID
,FieldName
,DisplayText
,FieldType
,sequence
,LookUpId
,DefaultValue
)

SELECT -50,'c.CasenoteType','Casenote Type',8,3,35,''
UNION ALL
SELECT -50,'c.CasenoteType','Secure Casenote Type',8,4,36,''
UNION ALL
SELECT -50,'c.Program','Program',8,5,37,''
UNION ALL
SELECT -50,'c.Role','Role',8,6,38,''
UNION ALL
SELECT -50,'c.GroupName','Group',8,7,39,''
UNION ALL
SELECT -50,'FORMAT(c.created_dttm,''yyyy-MM-dd'')','Casenote Version CreatedDate',4,13,Null,''



INSERT INTO lkplookuptable(
LkpName
,DisplayField
,ValueField
,Query
)
VALUES
('CasenoteType','CasenoteType','acttypetext'
,'SELECT DISTINCT acttypetext as id,acttypetext from lkpacttype where isnull(issecure,0)!=1 ORDER BY acttypetext ASC')

INSERT INTO lkplookuptable(
LkpName
,DisplayField
,ValueField
,Query
)
VALUES
('SecureCasenoteType','Secure CasenoteType','acttypetext'
,'SELECT DISTINCT acttypetext as id,acttypetext from lkpacttype where issecure=1 ORDER BY acttypetext ASC')


INSERT INTO lkplookuptable(
LkpName
,DisplayField
,ValueField
,Query
)
VALUES
('Program','Program','relationshipsubtypetext'
,'SELECT DISTINCT relationshipsubtypetext as id,relationshipsubtypetext from rel_lkp_relationshipsubtype where Rel_SubType_isProgram=1 ORDER BY relationshipsubtypetext ASC')

INSERT INTO lkplookuptable(
LkpName
,DisplayField
,ValueField
,Query
)
VALUES
('Role','Role','relationshiptypetext'
,'SELECT DISTINCT relationshiptypetext from rel_lkp_relationshiptype 
where RelationshipSubTypeId 
in(SELECT DISTINCT relationshipsubtypeid as id,relationshipsubtypeid from rel_lkp_relationshipsubtype where Rel_SubType_isProgram=1) 
ORDER BY relationshiptypetext ASC')

INSERT INTO lkplookuptable(
LkpName
,DisplayField
,ValueField
,Query
)
VALUES
('Group','Group','group_name'
,'select distinct group_name from user_groups 
where grouprole_sub_type_id 
in (SELECT DISTINCT relationshipsubtypeid as id,relationshipsubtypeid from rel_lkp_relationshipsubtype where Rel_SubType_isProgram=1) 
ORDER BY group_name ASC')

