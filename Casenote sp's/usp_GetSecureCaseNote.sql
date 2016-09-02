


--exec usp_GetSecureCaseNote 12801,800,'create'

IF exists (select 1 from sys.objects where name='usp_GetSecureCaseNote' and type='p')
DROP PROCEDURE usp_GetSecureCaseNote;

GO
CREATE PROCEDURE usp_GetSecureCaseNote
(  
  @user_id INT=null
 ,@group_id INT=null
 ,@PermissionType VARCHAR(10)=''	--create/update
)

AS

BEGIN

		DECLARE @user_type VARCHAR(20)
		SELECT @user_type=user_type from user_accounts where user_id=@user_id

		DECLARE @setting varchar(10)
		SELECT @setting=setting 
		FROM system_settings 
		where useroption=cast(@user_id as varchar(10))+'_cw_casenote_security'

		IF(@user_type='agency')
			
			BEGIN
					
					select acttypeid as SecureNoteTypeId ,acttypetext as SecureNoteTypes from lkpacttype where issecure=1

			END

		ELSE IF(@user_type='agency_user' and @setting='yes')

			BEGIN

					IF(@PermissionType='create')

						BEGIN

								with securenotetypes as(
								select sec_casenotetypeID as securenotetypeid from securitysettings where sec_cwID=@user_id and isCreate=1 and sec_groupID=@group_id)

								select l.acttypeid as SecureNoteTypeId ,l.acttypetext as SecureNoteTypes from lkpacttype l
								join securenotetypes s
								on l.acttypeid=s.securenotetypeid

						END	
					
					
					ELSE IF(@PermissionType='update')

						BEGIN

								with securenotetypes as(
								select sec_casenotetypeID as securenotetypeid from securitysettings where (sec_cwID=@user_id) and (isCreate=1 or isUpdate=1) and (sec_groupID=@group_id))

								select l.acttypeid as SecureNoteTypeId ,l.acttypetext as SecureNoteTypes from lkpacttype l
								join securenotetypes s
								on l.acttypeid=s.securenotetypeid

						END	

			END
				
END					

