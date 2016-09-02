


USE rolesqa

IF exists (select 1 from sys.objects where name='[dbo].[SP_Insert_MultipleRows]' and type='p')
DROP PROCEDURE [dbo].[SP_Insert_MultipleRows];

GO

Create PROCEDURE [dbo].[SP_Insert_MultipleRows] (
 @xmlData XML ,
 @retValue varchar(20) OUTPUT
)

AS
BEGIN
SET @retValue='Failed';

 

INSERT INTO  [Employee](
[id],
[firstName],
[lastName],
[company]
)
declare @xmlData XML
SELECT
[Table].[Column].value('ID[1]', 'int') as 'ID',
[Table].[Column].value('FirstName [1]', 'varchar(20)') as ' FirstName ',
[Table].[Column].value(' LastName[1]', 'varchar(20)') as ' LastName',
[Table].[Column].value(' Company [1]', 'varchar(50)') as ' Company'

 FROM @xmlData.nodes('/ Customers / customer') as [Table]([Column]
IF(@@ROWCOUNT > 0 )
  SET @retValue='SUCCESS';


END



 --Step2.Execute the procedure(F5) 

 --Step3. Testing - Execute the above stored procedure by passing the xml string







Declare @retValue1 varchar(50);
Declare @XmlStr XML;
SET @XmlStr='<Users>
 <customer>
    <ID>111589</ID>
    <FirstName>name1</FirstName>
    <LastName>Lname1</LastName>
    <Company>ABC</Company>
  </customer>
  <customer>
    <ID>12345</ID>
    <FirstName>name2</FirstName>
    <LastName>Lname2</LastName>
    <Company>ABC</Company>
  </customer>
  <customer>
    <ID>14567</ID>
    <FirstName>name3</FirstName>
    <LastName>Lname3</LastName>
    <Company>DEF</Company>
  </customer>
  </Users>';
  select @XmlStr

  SELECT
[Table].[Column].value('ID[1]', 'int') as 'ID',
[Table].[Column].value('FirstName [1]', 'varchar(20)') as ' FirstName ',
[Table].[Column].value(' LastName[1]', 'varchar(20)') as ' LastName',
[Table].[Column].value(' Company [1]', 'varchar(50)') as ' Company'

 FROM @xmlStr.nodes('/ Users / customer') as [Table]([Column])




 sp_helptext USP_SaveQuestionnaireAnswers







EXEC [SP_Insert_MultipleRows] @xmlData=@XmlStr,@retValue=@retValue1 OUTPUT
print @retValue1



drop table Employee

create table Employee(id int,
firstName varchar(20),
lastName varchar(20),
company varchar(50))

select * from Employee

															menuid
															,userid
															,group_id
															,enabledyn
															,isgroup
															,CreatedBy