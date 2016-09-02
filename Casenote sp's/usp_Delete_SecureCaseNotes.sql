

--EXEC usp_Delete_SecureCaseNotes @SecureNoteTypeId=
--								,@SubTypeId=


--PROCEDURE TO DELETE FROM lkpSecureCaseNoteTypes,lkpSecureCaseNoteSubTypes
--============================================================================

IF exists (select 1 from sys.objects where name='usp_Delete_SecureCaseNotes' and type='p')
DROP PROCEDURE usp_Delete_SecureCaseNotes;

GO

CREATE PROCEDURE usp_Delete_SecureCaseNotes
(
 @SecureNoteTypeId INT=null
,@SubTypeId INT=null						
)

AS
BEGIN

	DELETE FROM lkpSecureCaseNoteSubTypes WHERE SubTypeId=@SubTypeId
	DELETE FROM lkpSecureCaseNoteTypes WHERE TypeID=@SecureNoteTypeId

END


						
						

