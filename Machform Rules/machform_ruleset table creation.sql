


--CREATING machForm_RuleSet TABLE
--=================================

--USE mapdev

IF exists (select 1 from sys.objects where name='machForm_RuleSet' and type='u')
DROP TABLE machForm_RuleSet;

CREATE TABLE machForm_RuleSet
(
 RuleSetID				INT			 NOT NULL IDENTITY(1,1)
,RuleSetName			VARCHAR(20)	 NOT NULL
,FormID					INT			 NOT NULL
,RelationshipSubTypeID	INT			 NOT NULL
,RelationshipTypeID		INT			 NOT NULL
,Condition				VARCHAR(20)  NOT NULL
,GroupID				INT			 NOT NULL
,EnableYN				BIT			 NOT NULL
,CreatedBY				INT			 NOT NULL
,CreatedDate			DATETIME	 NOT NULL
,ModifiedBY				INT			 
,ModifiedDate			DATETIME	 
);

--ADDING PRIMARY KEYS
--========================

IF exists (select 1 from sys.objects where name='PK_machForm_RuleSet_RuleSetID' and type='pk')
ALTER table machForm_RuleSet
DROP constraint PK_machForm_RuleSet_RuleSetID;

ALTER TABLE machForm_RuleSet
ADD CONSTRAINT PK_machForm_RuleSet_RuleSetID 
primary key(RuleSetID);


--ADDING FOREIGN KEYS
--========================

IF exists (select 1 from sys.objects where name='FK_machForm_RuleSet_RelationshipSubTypeID' and type='f')
ALTER table machForm_RuleSet
DROP CONSTRAINT FK_machForm_RuleSet_RelationshipSubTypeID;

ALTER TABLE machForm_RuleSet
ADD CONSTRAINT FK_machForm_RuleSet_RelationshipSubTypeID 
foreign key(RelationshipSubTypeID)
REFERENCES Rel_lkp_RelationshipSubType(RelationshipSubTypeID);


IF exists (select 1 from sys.objects where name='FK_machForm_RuleSet_RelationshipTypeID' and type='f')
ALTER table machForm_RuleSet
DROP CONSTRAINT FK_machForm_RuleSet_RelationshipTypeID;

ALTER TABLE machForm_RuleSet
ADD CONSTRAINT FK_machForm_RuleSet_RelationshipTypeID 
foreign key(RelationshipTypeID)
REFERENCES Rel_lkp_RelationshipType(RelationshipTypeID) ;

IF exists (select 1 from sys.objects where name='FK_machForm_RuleSet_GroupID' and type='f')
ALTER table machForm_RuleSet
DROP CONSTRAINT FK_machForm_RuleSet_GroupID;

ALTER TABLE machForm_RuleSet
ADD CONSTRAINT FK_machForm_RuleSet_GroupID
foreign key(GroupID)
REFERENCES user_groups(group_id);

IF exists (select 1 from sys.objects where name='FK_machForm_RuleSet_CreatedBY' and type='f')
ALTER table machForm_RuleSet
DROP CONSTRAINT FK_machForm_RuleSet_CreatedBY;

ALTER TABLE machForm_RuleSet
ADD CONSTRAINT FK_machForm_RuleSet_CreatedBY
foreign key(CreatedBY)
REFERENCES user_accounts(user_id);

IF exists (select 1 from sys.objects where name='FK_machForm_RuleSet_ModifiedBY' and type='f')
ALTER table machForm_RuleSet
DROP CONSTRAINT FK_machForm_RuleSet_ModifiedBY;

ALTER TABLE machForm_RuleSet
ADD CONSTRAINT FK_machForm_RuleSet_ModifiedBY
foreign key(ModifiedBY)
REFERENCES user_accounts(user_id);


--CREATING machForm_RuleSetRules TABLE
--======================================

IF exists (select 1 from sys.objects where name='machForm_RuleSetRules' and type='u')
DROP TABLE machForm_RuleSetRules;

CREATE TABLE machForm_RuleSetRules
(
 RuleSetRulesID		INT			NOT NULL IDENTITY(1,1)
,RuleSetID			INT			NOT NULL
,RulesID			INT			NOT NULL
,DeletedYN			BIT			NOT NULL
,CreatedBY			INT			NOT NULL
,CreatedDate		DATETIME	NOT NULL
,ModifiedBY			INT	
,ModifiedDate		DATETIME	
);	


--ADDING PRIMARY KEYS
--========================

IF exists (select 1 from sys.objects where name='PK_machForm_RuleSetRules_RuleSetRulesID' and type='pk')
ALTER table machForm_RuleSetRules
DROP constraint PK_machForm_RuleSetRules_RuleSetRulesID;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT PK_machForm_RuleSetRules_RuleSetRulesID 
primary key(RuleSetRulesID);


--ADDING FOREIGN KEYS
--========================

IF exists (select 1 from sys.objects where name='FK_machForm_RuleSetRules_RuleSetID' and type='f')
ALTER table machForm_RuleSetRules
DROP CONSTRAINT FK_machForm_RuleSetRules_RuleSetID;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT FK_machForm_RuleSetRules_RuleSetID
foreign key(RuleSetID)
REFERENCES machForm_RuleSet(RuleSetID);


IF exists (select 1 from sys.objects where name='FK_machForm_RuleSetRules_RulesID' and type='f')
ALTER table machForm_RuleSetRules
DROP CONSTRAINT FK_machForm_RuleSetRules_RulesID;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT FK_machForm_RuleSetRules_RulesID
foreign key(RulesID)
REFERENCES machformprogramrole(id);


IF exists (select 1 from sys.objects where name='FK_machForm_RuleSetRules_CreatedBY' and type='f')
ALTER table machForm_RuleSetRules
DROP CONSTRAINT FK_machForm_RuleSetRules_CreatedBY;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT FK_machForm_RuleSetRules_CreatedBY
foreign key(CreatedBY)
REFERENCES user_accounts(user_id);


IF exists (select 1 from sys.objects where name='FK_machForm_RuleSetRules_ModifiedBY' and type='f')
ALTER table machForm_RuleSetRules
DROP CONSTRAINT FK_machForm_RuleSetRules_ModifiedBY;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT FK_machForm_RuleSetRules_ModifiedBY
foreign key(ModifiedBY)
REFERENCES user_accounts(user_id);


--ADDING DEFAULT CONSTRAINTS
--=============================

IF exists (select 1 from sys.objects where name='DF_machForm_RuleSetRules_DeletedYN' and type='d')
ALTER table machForm_RuleSetRules
DROP constraint DF_machForm_RuleSetRules_DeletedYN;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT DF_machForm_RuleSetRules_DeletedYN 
DEFAULT 0
FOR DeletedYN;



