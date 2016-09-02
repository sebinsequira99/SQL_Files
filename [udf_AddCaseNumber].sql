
select dbo.udf_AddCaseNumber(419,417,419)

update Rel_lkp_RelationshipType
set RelTypeAbbrev='FP'
where relationshiptypeid=-101

	Select coalesce(Rel_SubType_Abbrev,'')
		  ,coalesce(RelTypeAbbrev,'')
		  ,coalesce(RST.Rel_SubType_isProgram,'0')
		from dbo.Rel_Relationship R
			inner join Rel_lkp_RelationshipType RT on  R.RelationshipTypeId = RT.RelationshipTypeId
			inner join Rel_lkp_RelationshipSubType RST on  RT.RelationshipSubTypeId = RST.RelationshipSubTypeId
		Where RelationshipId = 419 

update Rel_Relationship
set rellabel='151124.01-FP'
where relationshipid=392

update Rel_lkp_RelationshipType
set RelTypeAbbrev='BF'
where RelationshipTypeId=-103


update Rel_Relationship
set rellabel=replace(rellabel,'Foster','FC')

FosterCare151116.33-FP
Foster151116.56-Child

select * into rel_relationship_bak_241115 from Rel_Relationship


Rel_Relationship where left(RelLabel,(len('')+6)) = '' + '171115'

rel_relationship where rellabel like '%fp%'

alter function [dbo].[udf_AddCaseNumber] (
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

				SELECT @NumberCntr = coalesce(substring(RelLabel,(len(@Rel_SubType_Abbrev)+8),2),0)
					from dbo.Rel_Relationship 
					where left(RelLabel,(len(@Rel_SubType_Abbrev)+6)) = @Rel_SubType_Abbrev + @DatePart1

				Set @NumberCntr = @NumberCntr + 1

				Set @CaseNumber = @Rel_SubType_Abbrev + @DatePart1 + '.' + right('00' + convert(VARCHAR,@NumberCntr),2) + '-' + @RelTypeAbbrev 
			End
		Else
			Set @CaseNumber = ''

		RETURN @CaseNumber
End

