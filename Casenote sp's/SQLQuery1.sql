


lkpSecureCaseNoteTypes
lkpSecureCaseNoteSubTypes

alter table lkpSecureCaseNoteSubTypes
add ContactActivityId int



GetCasenoteData
Add_CaseNote
Edit_CaseNote


sp_helptext Edit_CaseNote


Secure_Case_Note
Secure_Case_Note_Subtype


Code
noteType
CreatedBy
CreatedDate


Description
SecureNoteTypeID
ShowToAll
CreatedBy
CreatedDate


user_accounts
contact


SELECT u.first_name,u.last_name,c.actduration from ContactActivity c
JOIN user_accounts u
ON c.connid=u.connid
WHERE c.actduration > 0
ORDER BY u.first_name
