

use mapdev

--EXEC usp_Edit_SecureCaseNotes
--							   @TypeId =null,-- Pass existing SecureCaseNoteTypeId to update / null to insert
--							   @Code ='test',
--							   @SecureCaseNote ='test',
--							   @SubTypeId =null,-- Pass existing SecureCaseNoteSubTypeId to update / null to insert
--							   @SecureCaseNoteSubtype ='test',
--							   --@SecureNoteTypeId =18,-- For inserting into lkpSecureCaseNoteSubTypes table
--							   @ShowToAll =0,
--							   @UserId =1


--PROCEDURE TO INSERT AND UPDATE lkpSecureCaseNoteTypes,lkpSecureCaseNoteSubTypes
--=================================================================================

IF exists (select 1 from sys.objects where name='usp_Edit_SecureCaseNotes' and type='p')
DROP PROCEDURE usp_Edit_SecureCaseNotes;

GO

CREATE PROCEDURE usp_Edit_SecureCaseNotes
( 
 @TypeId INT=null
,@Code VARCHAR(20)=''
,@SecureCaseNote VARCHAR(MAX)=''
,@SubTypeId INT=null
,@SecureCaseNoteSubtype VARCHAR(MAX)=''
--,@SecureNoteTypeId INT=null
,@ShowToAll INT=null
,@UserId INT=null
)

AS
BEGIN
 		
		    IF EXISTS(select 1 from lkpSecureCaseNoteTypes where TypeID=@TypeId)  

					BEGIN

							UPDATE lkpSecureCaseNoteTypes
							SET	 Code=@Code
								,noteType=@SecureCaseNote
								,ModifiedBy=@UserId
								,ModifiedDate=getdate()

							WHERE TypeID=@TypeId

					END

			ELSE IF(isnull(@SecureCaseNote,'')!='')
					BEGIN

							INSERT INTO lkpSecureCaseNoteTypes(Code			
															  ,noteType							
															  ,CreatedBY
															  ,CreatedDate)				

							VALUES( @Code			
								   ,@SecureCaseNote					
								   ,@UserId
								   ,getdate())	

					END

			IF EXISTS(select 1 from lkpSecureCaseNoteSubTypes where SubTypeID=@SubTypeId)
					
					BEGIN

							UPDATE lkpSecureCaseNoteSubTypes
							SET	 Description=@SecureCaseNoteSubtype
								,ShowToAll=@ShowToAll
								,ModifiedBy=@UserId
								,ModifiedDate=getdate()

							WHERE SubTypeID=@SubTypeId

					END

		    ELSE IF(isnull(@SecureCaseNoteSubtype,'')!='')

					BEGIN

							INSERT INTO lkpSecureCaseNoteSubTypes(Description			
																 ,ShowToAll						
																 ,CreatedBY
																 ,CreatedDate)				

							VALUES( @SecureCaseNoteSubtype			
								   ,@ShowToAll				
								   ,@UserId
								   ,getdate())	


					END

END
	

