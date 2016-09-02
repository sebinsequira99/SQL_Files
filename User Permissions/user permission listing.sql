



USE rolesqa



IF exists (select 1 from sys.objects where name='usp_user_listing' and type='p')
DROP PROCEDURE usp_user_listing;

GO

CREATE PROCEDURE usp_user_listing 
(
@CategoryID			INT = 0
,@ReportID			INT = 0
,@StRow				INT = 0
,@EndRow			INT = 100
,@Name				Varchar(MAX)=''
)

AS

BEGIN

 
DECLARE @RunSQL NVARCHAR(MAX)
DECLARE @Fname Varchar(MAX)
DECLARE @Lname Varchar(MAX)

SELECT @Fname=LTRIM(RTRIM(substring(@name, 1,charindex(' ',@name))))  ,@Lname=LTRIM(RTRIM(substring(@name, charindex(' ',@name),len(@name)-charindex(' ',@name)+1)))

	CREATE TABLE #UserGroupList(ID INT identity(1,1),User_id INT,NAME VARCHAR(MAX),UGType INT,Assigned BIT )
	

		--INSERT INTO #UserGroupList (User_id,NAME,UGType,Assigned)
		IF( @CategoryID != 0)

		SET @RunSQL ='SELECT U.User_id as ID, ISNULL(U.first_name,'''') +'' '' +	ISNULL(U.last_name,'''') AS [NAME], 
						UGType, ISNULL(ABS(C.DeletedYN-1),0) Assigned
						FROM user_Accounts U LEFT JOIN rptCategoryUsers C ON U.user_id=C.UserID AND C.CategoryID= '+CAST(@CategoryID as VARCHAR(50))+'
						WHERE user_type NOT IN(''Agency_User'' ,''agency'',''Admin'') AND (U.first_name!='''' AND U.last_name !='''' )' 
        
		ELSE IF (@CategoryID = 0)
		SET @RunSQL ='SELECT U.User_id as ID, ISNULL(U.first_name,'''') +'' '' +	ISNULL(U.last_name,'''') AS [NAME], 
						UGType, ISNULL(ABS(C.DeletedYN-1),0) Assigned
						FROM user_Accounts U LEFT JOIN rptReportUsers C ON U.user_id=C.UserID AND C.ReportID= '+CAST(@ReportID as VARCHAR(50))+'
						JOIN sys_menu m on m.CreatedBy=u.user_id
						JOIN sys_permissions p on p.CreatedBy=u.user_id
						WHERE user_type NOT IN(''Agency_User'' ,''agency'',''Admin'') AND (U.first_name!='''' AND U.last_name !='''' )' 

		If @Name > ''
				SET @RunSQL = @RunSQL+'AND (U.First_Name like ''%' + @Fname + '%'' AND U.Last_NAme like ''%' +@Lname+ '%'') OR 
									(U.First_Name like ''%'+@Lname+'%'' AND U.Last_NAme like ''%'+@Fname+'%'')'  		
				PRINT @RunSQL
				
				INSERT INTO #UserGroupList (User_id,NAME,UGType,Assigned)
				EXEC(@RunSQL)

		


		SELECT SCOPE_IDENTITY() as TotalCount,User_id AS ID,NAME,UGType,Assigned FROM #UserGroupList
		WHERE ID > @StRow  AND ID <=  @EndRow ORDER BY Name




END


EXEC usp_user_listing @CategoryID= 0
						,@ReportID= 0
						,@StRow=0
						,@EndRow=100 
						,@Name=''

