

IF EXISTS (SELECT 1 FROM sys.objects WHERE name='udf_AddCaseNumber' AND type='fn')
DROP FUNCTION udf_AddCaseNumber;
GO

CREATE FUNCTION [dbo].[udf_AddCaseNumber] (
		@RelationshipId int = 0,
		@ConnId int = 0,
		@ConnectionId int = 0)
-- If @RelationshipId > 0 Add Case Number for that RelationshipId
-- If @RelationshipId = 0 and Case Number for @ConnId/ConnectionId Combination

Returns varchar(100) as
BEGIN
	Declare @NumberCntr numeric,
			@DatePart1 varchar(100),
			@strsql nvarchar(3000),
			@ParamDef nvarchar(3000),
			@Rel_SubType_Abbrev varchar(100),
			@RelTypeAbbrev varchar(100),
			@IsProgramChk varchar(4),
			@CaseNumber varchar(100)
	
	If @RelationshipId = 0
		Select @RelationshipId = RelationshipId 
				from dbo.Rel_Relationship 
			Where Connid = @ConnId and ConnectionId = @ConnectionId

	
	Select @Rel_SubType_Abbrev = coalesce(Rel_SubType_Abbrev,''),
		@RelTypeAbbrev = coalesce(RelTypeAbbrev,''),
		@IsProgramChk = coalesce(RST.Rel_SubType_isProgram,'0')
		from dbo.Rel_Relationship R
			inner join Rel_lkp_RelationshipType RT on  R.RelationshipTypeId = RT.RelationshipTypeId
			inner join Rel_lkp_RelationshipSubType RST on  RT.RelationshipSubTypeId = RST.RelationshipSubTypeId
		Where RelationshipId = @RelationshipId 

		If @IsProgramChk = '1'
			Begin
				SELECT @DatePart1 = right(convert(varchar, getdate(), 112),6)
				
				Set @NumberCntr = 0

				--Modified to resolve issue occuring when editing @NumberCntr part in case number to non numeric value

				SELECT @NumberCntr = max(substring(RelLabel,(len(@Rel_SubType_Abbrev)+8),2)) from dbo.Rel_Relationship 
				where left(RelLabel,(len(@Rel_SubType_Abbrev)+6)) = @Rel_SubType_Abbrev + @DatePart1
				and isnumeric(substring(RelLabel,(len(@Rel_SubType_Abbrev)+8),2))=1

				Set @NumberCntr = @NumberCntr + 1

				Set @CaseNumber = @Rel_SubType_Abbrev + @DatePart1 + '.' + right('00' + convert(VARCHAR,@NumberCntr),2) + '-' + @RelTypeAbbrev
			End
		Else
			Set @CaseNumber = ''

		RETURN @CaseNumber
End



