

USE rolesqa



IF exists (select 1 from sys.objects where name='usp_group_listing' and type='p')
DROP PROCEDURE usp_group_listing;

GO

CREATE PROCEDURE usp_group_listing 
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

SELECT @Fname=LTRIM(RTRIM(substring(@name,1,charindex(' ',@name))))  ,@Lname=LTRIM(RTRIM(substring(@name, charindex(' ',@name),len(@name)-charindex(' ',@name)+1)))

	CREATE TABLE #UserGroupList(ID INT identity(1,1),User_id INT,NAME VARCHAR(MAX))
		 

		 IF( @CategoryID != 0)
			 SELECT g.group_id as ID, ISNULL(group_name,'') [NAME]
			 FROM User_Groups G LEFT JOIN rptCategoryUsers C ON G.group_id=C.GroupID AND C.CategoryID=@CategoryID
			 WHERE group_name!=''
			 ORDER BY group_name
		 ELSE IF (@CategoryID = 0)
			 SELECT g.group_id as ID, ISNULL(group_name,'') [NAME]
			 FROM User_Groups G LEFT JOIN rptReportUsers C ON G.group_id=C.GroupID AND C.ReportID=@ReportID
			 WHERE group_name!=''
			 ORDER BY group_name
	END



EXEC usp_group_listing @CategoryID= 0
						,@ReportID= 0
						,@StRow=0
						,@EndRow=100 
						,@Name=''
