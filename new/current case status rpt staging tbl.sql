

mapsdc

CREATE TABLE CurrentCaseStatus
			(
			 GroupName	varchar(max)
			,Program	varchar(max)
			,[Role]	varchar(max)
			,ClientName varchar(max)	
			,CurrentCaseStatus varchar(max)
			,CaseNumber varchar(max)
			,username varchar(max)	
			,PhaseName varchar(max)
			)

insert into CurrentCaseStatus 
EXEC currentcasestatuslist '196', '' , '', '', '' ,'' ,'' , '' , '' , '' ,'','0','8125'

