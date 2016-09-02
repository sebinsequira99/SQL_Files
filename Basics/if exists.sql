

--COLUMN
IF EXISTS (SELECT 1 FROM information_schema.columns WHERE column_name='mainRecord' AND table_name='user_agencies')
BEGIN
	ALTER TABLE user_agencies 
	DROP COLUMN mainRecord
END

--TABLE
IF EXISTS (select 1 from sys.objects where name='library_systemdata' and type='u')
DROP TABLE library_systemdata

--SP
IF EXISTS (SELECT 1 FROM sys.objects WHERE name='usp_GetFinanceDetails_AP' AND type='p')
DROP PROCEDURE usp_GetFinanceDetails_AP;

--FUNCTION
IF EXISTS (SELECT 1 FROM sys.objects WHERE name='udf_AddCaseNumber' AND type='fn')
DROP FUNCTION udf_AddCaseNumber;

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

--ADDING DEFAULT CONSTRAINTS
--=============================

IF exists (select 1 from sys.objects where name='DF_machForm_RuleSetRules_DeletedYN' and type='d')
ALTER table machForm_RuleSetRules
DROP constraint DF_machForm_RuleSetRules_DeletedYN;

ALTER TABLE machForm_RuleSetRules
ADD CONSTRAINT DF_machForm_RuleSetRules_DeletedYN 
DEFAULT 0
FOR DeletedYN;