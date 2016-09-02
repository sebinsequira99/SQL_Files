

declare @xmlinput xml
set @xmlinput='<xml>
	<lkpdetails>
		<lkp>lkpCountry</lkp>
		<lkp_value>CountryID</lkp_value>
		<lkp_text>CountryText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpDegree</lkp>
		<lkp_value>DegreeText</lkp_value>
		<lkp_text>DegreeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpEthnicity</lkp>
		<lkp_value>EthnicityTypeText</lkp_value>
		<lkp_text>EthnicityTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpLanguage</lkp>
		<lkp_value>LanguageText</lkp_value>
		<lkp_text>LanguageText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpLanguage</lkp>
		<lkp_value>LanguageText</lkp_value>
		<lkp_text>LanguageText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpMaritalStatus</lkp>
		<lkp_value>MaritalStatusText</lkp_value>
		<lkp_text>MaritalStatusText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpReligion</lkp>
		<lkp_value>ReligionText</lkp_value>
		<lkp_text>ReligionText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpSalutation</lkp>
		<lkp_value>SalutationText</lkp_value>
		<lkp_text>SalutationText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpTermReason</lkp>
		<lkp_value>TermReasonText</lkp_value>
		<lkp_text>TermReasonText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpTermReason</lkp>
		<lkp_value>TermReasonText</lkp_value>
		<lkp_text>TermReasonText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpCountry</lkp>
		<lkp_value>CountryID</lkp_value>
		<lkp_text>CountryText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpCountry</lkp>
		<lkp_value>CountryText</lkp_value>
		<lkp_text>CountryText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpDegree</lkp>
		<lkp_value>DegreeText</lkp_value>
		<lkp_text>DegreeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpEthnicity</lkp>
		<lkp_value>EthnicityTypeText</lkp_value>
		<lkp_text>EthnicityTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpLanguage</lkp>
		<lkp_value>LanguageText</lkp_value>
		<lkp_text>LanguageText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpLanguage</lkp>
		<lkp_value>LanguageText</lkp_value>
		<lkp_text>LanguageText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpMaritalStatus</lkp>
		<lkp_value>MaritalStatusText</lkp_value>
		<lkp_text>MaritalStatusText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpReligion</lkp>
		<lkp_value>ReligionText</lkp_value>
		<lkp_text>ReligionText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpTermReason</lkp>
		<lkp_value>TermReasonText</lkp_value>
		<lkp_text>TermReasonText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpTermReason</lkp>
		<lkp_value>TermReasonText</lkp_value>
		<lkp_text>TermReasonText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpCountry</lkp>
		<lkp_value>CountryID</lkp_value>
		<lkp_text>CountryText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpCounty</lkp>
		<lkp_value>CountyID</lkp_value>
		<lkp_text>CountyText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Emp_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Emp_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpProgram</lkp>
		<lkp_value>ProgramName</lkp_value>
		<lkp_text>ProgramName</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Ref_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpCountry</lkp>
		<lkp_value>CountryText</lkp_value>
		<lkp_text>CountryText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpCounty</lkp>
		<lkp_value>CountyText</lkp_value>
		<lkp_text>CountyText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpEthnicity</lkp>
		<lkp_value>EthnicityTypeText</lkp_value>
		<lkp_text>EthnicityTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpEthnicity</lkp>
		<lkp_value>EthnicityTypeText</lkp_value>
		<lkp_text>EthnicityTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpRace</lkp>
		<lkp_value>RaceText</lkp_value>
		<lkp_text>RaceText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpgender</lkp>
		<lkp_value>GenderAbbreviation</lkp_value>
		<lkp_text>GenderText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>Fam_RelationshipType</lkp>
		<lkp_value>RelationshipTypeText</lkp_value>
		<lkp_text>RelationshipTypeText</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpState</lkp>
		<lkp_value>StateAbbreviation</lkp_value>
		<lkp_text>StateAbbreviation</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>lkpSubProgram</lkp>
		<lkp_value>SubProgramName</lkp_value>
		<lkp_text>SubProgramName</lkp_text>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:1</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:2</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:3</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:15</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:1</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:2</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:3</lkp_where>
	</lkpdetails>
	<lkpdetails>
		<lkp>MedGenPulldown</lkp>
		<lkp_value>MedGenPullDownText</lkp_value>
		<lkp_text>MedGenPullDownText</lkp_text>
		<lkp_where>MedGenSubTypeId:15</lkp_where>
	</lkpdetails>
</xml>'
	
;
 WITH xmldata_input
 AS 
 (
 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
 ,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
 FROM @xmlinput.nodes('//.') as [table]([column])
 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
 )

 SELECT * into #xmldata_input FROM xmldata_input
 
 ALTER TABLE #xmldata_input
 ADD id int identity(1,1)

 ;with pivottbl as
  (
  Select GRPNO, Max(lkp) lkp, Max(lkp_value)  lkp_value, Max(lkp_text) lkp_text From (
  SELECT       
  GRPNO,lkp
  ,lkp_value
  ,lkp_text
   FROM (SELECT DENSE_RANK() Over (Partition By RNK Order By ID) GRPNO,*
   FROM(  Select  DENSE_RANK() Over (Order By inputfieldname) RNK,* From #xmldata_input Where inputfieldname IN 
		('lkp','lkp_value','lkp_text') )as rk) AS SourceTable
   PIVOT
  (
  max(inputfieldvalue)
  FOR inputfieldname IN 
  (lkp
  ,lkp_value
  ,lkp_text
  )) AS PivotTable  ) Tst Group by GRPNO
  )

  select * into lkpdetails from pivottbl

alter table lkpdetails
add fieldname varchar(200)

drop table #fields

create table #fields(fieldname varchar(200),id int)

insert into #fields(fieldname,id)
select 'AP1BirthCountry'					 ,1
union select 'AP1BirthState'				 ,2
union select 'AP1Degree'					 ,3
union select 'AP1Ethnicity'					 ,4
union select 'AP1Gender'					 ,5
union select 'AP1Language'					 ,6
union select 'AP1Language2'					 ,7
union select 'AP1MarriageStatus2'			 ,8
union select 'AP1Race'						 ,9
union select 'AP1Race2'						 ,10
union select 'AP1Race3'						 ,11
union select 'AP1Religion'					 ,12
union select 'AP1Salutation'				 ,13
union select 'AP1TermReason'				 ,14
union select 'AP1TermReason2'				 ,15
union select 'AP2BirthCountry'				 ,16
union select 'AP2BirthState'				 ,17
union select 'AP2Country'					 ,18
union select 'AP2Degree'					 ,19
union select 'AP2Ethnicity'					 ,20
union select 'AP2Gender'					 ,21
union select 'AP2Language'					 ,22
union select 'AP2Language2'					 ,23
union select 'AP2MarriageStatus2'			 ,24
union select 'AP2Race'						 ,25
union select 'AP2Race2'						 ,26
union select 'AP2Race3'						 ,27
union select 'AP2Religion'					 ,28
union select 'AP2State'						 ,29
union select 'AP2TermReason'				 ,30
union select 'AP2TermReason2'				 ,31
union select 'Country'						 ,32
union select 'County'						 ,33
union select 'Emp1Relationship'				 ,34
union select 'Emp1State'					 ,35
union select 'Emp2Relationship'				 ,36
union select 'Emp2State'					 ,37
union select 'Program'						 ,38
union select 'Ref10Relationship'			 ,39
union select 'Ref10State'					 ,40
union select 'Ref1Relationship'				 ,41
union select 'Ref1State'					 ,42
union select 'Ref2Relationship'				 ,43
union select 'Ref2State'					 ,44
union select 'Ref3Relationship'				 ,45
union select 'Ref3State'					 ,46
union select 'Ref4Relationship'				 ,47
union select 'Ref4State'					 ,48
union select 'Ref5Relationship'				 ,49
union select 'Ref5State'					 ,50
union select 'Ref6Relationship'				 ,51
union select 'Ref6State'					 ,52
union select 'Ref7Relationship'				 ,53
union select 'Ref7State'					 ,54
union select 'Ref8Relationship'				 ,55
union select 'Ref8State'					 ,56
union select 'Ref9Relationship'				 ,57
union select 'Ref9State'					 ,58
union select 'Rel10Gender'					 ,59
union select 'Rel10Relationship'			 ,60
union select 'Rel10State'					 ,61
union select 'Rel1Country'					 ,62
union select 'Rel1County'					 ,63
union select 'Rel1Ethnicity1'				 ,64
union select 'Rel1Ethnicity2'				 ,65
union select 'Rel1Gender'					 ,66
union select 'Rel1Race1'					 ,67
union select 'Rel1Race2'					 ,68
union select 'Rel2Gender'					 ,69
union select 'Rel2Relationship'				 ,70
union select 'Rel2State'					 ,71
union select 'Rel3Gender'					 ,72
union select 'Rel3Relationship'				 ,73
union select 'Rel3State'					 ,74
union select 'Rel4Gender'					 ,75
union select 'Rel4Relationship'				 ,76
union select 'Rel4State'					 ,77
union select 'Rel5Gender'					 ,78
union select 'Rel5Relationship'				 ,79
union select 'Rel5State'					 ,80
union select 'Rel6Gender'					 ,81
union select 'Rel6Relationship'				 ,82
union select 'Rel6State'					 ,83
union select 'Rel7Gender'					 ,84
union select 'Rel7Relationship'				 ,85
union select 'Rel7State'					 ,86
union select 'Rel8Gender'					 ,87
union select 'Rel8Relationship'				 ,88
union select 'Rel8State'					 ,89
union select 'Rel9Gender'					 ,90
union select 'Rel9Relationship'				 ,91
union select 'Rel9State'					 ,92
union select 'State'						 ,93
union select 'SubProgram'					 ,94
union select 'Med_1EyeColor'				 ,95
union select 'Med_1HairColor'				 ,96
union select 'Med_1Height'					 ,97
union select 'Med_1Sex'						 ,98
union select 'Med_2EyeColor'				 ,99
union select 'Med_2HairColor'				 ,100
union select 'Med_2Height'					 ,101
union select 'Med_2Sex'						 ,102

update ld
set ld.fieldname=f.fieldname
from lkpdetails ld
join #fields f
on f.id=ld.grpno

alter table lkpdetails
add lkp_where varchar(200)

update lkpdetails
set lkp_where='MedGenSubTypeId:15'
where grpno in (98,102)