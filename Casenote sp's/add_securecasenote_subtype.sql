

--EXEC usp_Add_SecureCaseNoteSubType
--							   @TypeId =null,-- Pass existing SecureCaseNoteTypeId to update / null to insert
--							   @Code ='test',
--							   @SecureCaseNote ='test',
--							   @SubTypeId =null,-- Pass existing SecureCaseNoteSubTypeId to update / null to insert
--							   @SecureCaseNoteSubtype ='test',
--							   @SecureNoteTypeId =18,-- For inserting into SecureCaseNoteSubTypes table
--							   @ShowToAll =0,
--							   @UserId =1


--PROCEDURE TO INSERT AND UPDATE SecureCaseNoteSubTypes
--=================================================================================

IF exists (select 1 from sys.objects where name='usp_Add_SecureCaseNoteSubType' and type='p')
DROP PROCEDURE usp_Add_SecureCaseNoteSubType;

GO

CREATE PROCEDURE usp_Add_SecureCaseNoteSubType
( 
 @SubTypeId INT=null
,@SecureCaseNoteSubtype VARCHAR(MAX)=''
,@SecureNoteTypeId INT=null
,@ShowToAll INT=null
,@UserId INT=null
)

AS
BEGIN

			IF EXISTS(select 1 from SecureCaseNoteSubTypes where SubTypeID=@SubTypeId)

					BEGIN

							UPDATE SecureCaseNoteSubTypes
							SET	 Description=@SecureCaseNoteSubtype
								,SecureNoteTypeID=@SecureNoteTypeId
								,ShowToAll=@ShowToAll
								,ModifiedBy=@UserId
								,ModifiedDate=getdate()

							WHERE SubTypeID=@SubTypeId

							UPDATE lkpSecureCaseNoteSubTypes
							SET	 Description=@SecureCaseNoteSubtype
								,ShowToAll=@ShowToAll
								,ModifiedBy=@UserId
								,ModifiedDate=getdate()

							WHERE SubTypeID=@SubTypeId

					END

		    ELSE IF(isnull(@SecureCaseNoteSubtype,'')!='')

					BEGIN

							INSERT INTO SecureCaseNoteSubTypes(Description			
															  ,SecureNoteTypeID	
															  ,ShowToAll						
															  ,CreatedBY
															  ,CreatedDate)				

							VALUES( @SecureCaseNoteSubtype			
								   ,@SecureNoteTypeId	
								   ,@ShowToAll				
								   ,@UserId
								   ,getdate())	

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
	

