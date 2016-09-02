

CREATE PROCEDURE [dbo].[SP_EditConnection]
         @CAccountKey varchar(100)= '0',
         @ConnectionId int = 0,  
         @ConnID1 int = 0,  
         @RelTypeID1 varchar(100) = '0',
         @ConnID2 int = 0,  
         @RelLabel varchar(250) = '',
         @dtStartDate datetime = Null,
         @dtRelEndDate datetime = Null,
		 @AssociationConnid INT = 0,
		 @AssociationRelationshipTypeId INT =0
         
--			,@RelDate varchar(25) = ''  
--       ,@RelEndDate varchar(25) = ''  
--			,@MemberSeq int = -1
AS

BEGIN
   DECLARE	@strDBName VARCHAR(MAX),
				@strsql nvarchar(3000),
				@ParamDef  nvarchar(3000),
				@RelTypeID2 int,
				@SaveConnectionId int,
				@ConnectionPriority int,
				@ConnectionPriorityChk int,
           @ConnectionIdOut int          
        /* finding agency according to CAccountKey*/

         IF ( @CAccountKey <>'' AND ISNUMERIC(@CAccountKey)=1)

            BEGIN 
                   SELECT  DISTINCT @strDBName= '['+[DBName]+']' 
                   FROM [IrrisCentral].[dbo].[lutPrimaryAgency] 
                   WHERE SiteID=@CAccountKey
            END
            
         IF (@strDBName is not null)
            BEGIN
					SET NOCOUNT ON
--					If @RelDate = ''
--						Set @RelDate = convert(varchar, getdate(), 101)

					If @RelTypeID1 = '0' and @ConnID1 = 0 and @ConnID2 = 0 and @ConnectionId <> 0
						Begin
							SET @strSql = 'Delete from ' + @strDBName + '.[dbo].Rel_Relationship
								where ConnectionId = ' + Cast(@ConnectionId as varchar(10))

							 Print @strsql
							EXEC (@strsql)
						End
						
					If @RelTypeID1 <> '0'
						Begin
							Set @ParamDef = '@RelTypeId2 int output'

							Set @strSql = 'select @RelTypeId2 = ' + @strDBName + '.dbo.udf_RecipRelTypeId(' + cast(@RelTypeId1 as varchar(50)) + ',' + cast(@ConnId1 as varchar(50)) + ') '

							Print @strSql
							Exec sp_executesql @strSql,@ParamDef,@RelTypeId2=@RelTypeId2 output

							Set @RelTypeId2 = @RelTypeId2

							SET @strSql = 'Update ' + @strDBName + '.[dbo].Rel_Relationship
								Set ConnId = ' + Cast(@ConnId1 as varchar(10)) + ',
									RelationshipTypeId = ' + @RelTypeId1 + ',
									RelEndDate = '''+CONVERT(VARCHAR(10), @dtRelEndDate,110) +''',
									RelationshipDateLastUpdated ='''+CONVERT(VARCHAR(10), @dtStartDate,110) +''',
									AssociationConnid = ' + Cast(@AssociationConnid as varchar(10)) + ', 
									AssociationRelationshipTypeId = ' + Cast(@AssociationRelationshipTypeId as varchar(10)) + '  
								where ConnectionId = ' + Cast(@ConnectionId as varchar(10)) + '
									--and Connid <> ' + Cast(@ConnId2 as varchar(10))

 				Print @strsql
				EXEC (@strsql)

				IF @RelTypeId1=-42   --BIRTHNAME
				BEGIN
							SET @strSql = 'Update ' + @strDBName + '.[dbo].CONTACT
								Set BIRTHNAME = (SELECT ISNULL(FNAME,'''') + '' ''+ISNULL(LNAME,'''') FROM ' + @strDBName + '.DBO.CONTACT 
								WHERE CONTACTID= ' + Cast(@Connid1*-1 as varchar(10)) + ')
								where CONTACTID = ' + Cast(@Connid2*-1 as varchar(10)) 
								 
						 Print @strsql						
							EXEC (@strsql)
				END
							
					END	
					SET NOCOUNT OFF
            END
END

--    EXEC [SP_EditConnection] '164', -76304, -76304,'-76304',0,null,'2013-08-10','2013-08-23'
