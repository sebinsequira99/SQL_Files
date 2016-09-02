


USE rolesqa



IF exists (select 1 from sys.objects where name='usp_user_listing' and type='p')
DROP PROCEDURE usp_user_listing;

GO

CREATE PROCEDURE usp_user_listing 
(
 @StRow				INT = 0
,@EndRow			INT = 100
,@Name				Varchar(MAX)=''
)

AS

BEGIN

 
DECLARE @RunSQL NVARCHAR(MAX)
DECLARE @Fname Varchar(MAX)
DECLARE @Lname Varchar(MAX)

SELECT @Fname=LTRIM(RTRIM(substring(@name, 1,charindex(' ',@name))))  ,@Lname=LTRIM(RTRIM(substring(@name, charindex(' ',@name),len(@name)-charindex(' ',@name)+1)))

	CREATE TABLE #UserGroupList(ID INT identity(1,1),User_id INT,NAME VARCHAR(MAX))
	

		--INSERT INTO #UserGroupList (User_id,NAME,)
		IF( @CategoryID != 0)

		SET @RunSQL ='SELECT U.User_id as ID, ISNULL(U.first_name,'''') +'' '' +	ISNULL(U.last_name,'''') AS [NAME] 
						FROM user_Accounts U 
						WHERE user_type IN(''Agency_User'') AND (U.first_name!='''' AND U.last_name !='''' )' 

		If @Name > ''
				SET @RunSQL = @RunSQL+'AND (U.First_Name like ''%' + @Fname + '%'' AND U.Last_NAme like ''%' +@Lname+ '%'') OR 
									(U.First_Name like ''%'+@Lname+'%'' AND U.Last_NAme like ''%'+@Fname+'%'')'  		
				PRINT @RunSQL
				
				INSERT INTO #UserGroupList (User_id,NAME)
				EXEC(@RunSQL)

		


		SELECT SCOPE_IDENTITY() as TotalCount,User_id AS ID,NAME FROM #UserGroupList
		WHERE ID > @StRow  AND ID <=  @EndRow ORDER BY Name




END

