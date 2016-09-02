

use rolesqa

GO
IF exists (select 1 from sys.objects where name='USP_GetFastFactData' and type='p')
DROP PROCEDURE USP_GetFastFactData;

GO


CREATE PROCEDURE dbo.USP_GetFastFactData
(
 @Rel_CustomTemplateId  INT
,@User_id				INT
,@connid				INT
,@connectionid			INT
)

AS
BEGIN
					
					SELECT   fd.Id			
							,fd.date1		
							,fd.date2			
							,fd.date3			
							,fd.date4			
							,fd.date5			
							,fd.date6			
							,fd.date7			
							,fd.date8			
							,fd.date9			
							,fd.date10			
							,fd.text1				
							,fd.text2				
							,fd.text3				
							,fd.text4				
							,fd.text5				
							,fd.text6				
							,fd.text7				
							,fd.text8				
							,fd.text9				
							,fd.text10			
							,fd.user_id			
							,fd.connid			
							,fd.connectionid
							,fc.fieldid
							,fc.fieldname
							,fc.caption
							,fc.fieldtype
							,fc.seq
							,fc.datafield
							,fc.lookupid	
								
								
							FROM
									fastfactdata fd
									INNER JOIN fastfactsconfiguration fc ON (fd.Rel_CustomTemplateId=fc.fieldid)
		
							WHERE   fc.fieldid=@Rel_CustomTemplateId
									AND fd.user_id=@user_id		
									AND fd.connid=@connid		
									AND fd.connectionid=@connectionid


END

