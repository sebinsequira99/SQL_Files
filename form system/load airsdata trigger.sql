USE [MAPDEV]
GO
/****** Object:  Trigger [dbo].[LoadAIRSData]    Script Date: 9/11/2015 6:03:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Vince Rossignol>
-- Create date: <06/14/2010>
-- Description:	<Load AIRS Data>
-- =============================================
ALTER TRIGGER [dbo].[LoadAIRSData] 
   ON  [dbo].[MAPSystemData]
   AFTER  Update
AS 
BEGIN
	SET NOCOUNT ON;
	Declare @Agency varchar(150),
				@AP1LName varchar(50),
				@AP1ContactId int,
				@ContactAIRSId int,
				@AgencyId int,
				@user_id int
--Set @user_id = 28
	Select @AgencyId = Agency,
			@AP1ContactId = AP1ContactId,
			@ContactAIRSId = ContactAIRSId,
			@user_id = [user_id]
		From inserted

	Select @Agency = DBName
	From IrrisCentral.dbo.lutPrimaryAgency
	where SiteID = @AgencyId

If Update(AP1Fname) or Update(AP1Mname)or Update(AP1LName)or Update(AP1DOB)or Update(AP1Gender)or Update(AP1SSN)or Update(AP1Salutation)
	Exec MAPUpdateContact @Agency, @AP1ContactId, @user_id, 'AP1'

If Update(AP1Race)
	Exec MAPRaceAddEdit @Agency, @user_id, 'AP1'

If Update(AP1Religion)
	Exec MAPReligionAddEdit @Agency, @user_id, 'AP1'

If Update(AP1Ethnicity)
	Exec MAPEthnicityAddEdit @Agency, @user_id, 'AP1'

If Update(AP2Fname) or Update(AP2Mname)or Update(AP2LName)or Update(AP2DOB)or Update(AP2Gender)or Update(AP2SSN)or Update(AP2Salutation)
	Exec MAPAdditionalContact @Agency, @user_id, 'AP2'

If Update(AP2Race)
	Exec MAPRaceAddEdit @Agency, @user_id, 'AP2'

If Update(AP2Religion)
	Exec MAPReligionAddEdit @Agency, @user_id, 'AP2'

If Update(AP2Ethnicity)
	Exec MAPEthnicityAddEdit @Agency, @user_id, 'AP2'

If Update(Add1) or Update(Add2)or Update(City)or Update(State)or Update(Zip)or Update(Country)
	Exec MAPAddressAddEdit @Agency, @user_id

If Update(HomePhone)
	Exec MAPHPhoneAddEdit @Agency, @user_id

If Update(AP1WorkPhone)or Update(AP1CellPhone)
	Exec MAPOtherPhoneAddEdit @Agency, @user_id, 'AP1'

If Update(AP2WorkPhone)or Update(AP2CellPhone)
	Exec MAPOtherPhoneAddEdit @Agency, @user_id, 'AP2'

If Update(AP1Email)
	Exec MAPEmailAddEdit @Agency, @user_id, 'AP1'

If Update(AP2Email)
	Exec MAPEmailAddEdit @Agency, @user_id, 'AP2'

If Update(AP1Degree) or Update(AP1Institution) or Update(AP1DegreeYear)
	Exec MAPEducationAddEdit @Agency, @user_id, 'AP1'

If Update(AP2Degree) or Update(AP2Institution) or Update(AP2DegreeYear)
	Exec MAPEducationAddEdit @Agency, @user_id, 'AP2'

If Update(Rel1FName) or Update(Rel1LName) or Update(Rel1Gender) or Update(Rel1DOB) or Update(Rel1Relationship) or Update(Rel1Add1) or Update(Rel1Add2) or Update(Rel1City) or Update(Rel1State) or Update(Rel1Zip) or Update(Rel1Email) or Update(Rel1HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel1'

If Update(Rel2FName) or Update(Rel2LName) or Update(Rel2Gender) or Update(Rel2DOB) or Update(Rel2Relationship) or Update(Rel2Add1) or Update(Rel2Add2) or Update(Rel2City) or Update(Rel2State) or Update(Rel2Zip) or Update(Rel2Email) or Update(Rel2HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel2'

If Update(Rel3FName) or Update(Rel3LName )or Update(Rel3Gender) or Update(Rel3DOB) or Update(Rel3Relationship) or Update(Rel3Add1) or Update(Rel3Add2) or Update(Rel3City) or Update(Rel3State) or Update(Rel3Zip) or Update(Rel3Email) or Update(Rel3HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel3'

If Update(Rel4FName) or Update(Rel4LName )or Update(Rel4Gender) or Update(Rel4DOB) or Update(Rel4Relationship) or Update(Rel4Add1) or Update(Rel4Add2) or Update(Rel4City) or Update(Rel4State) or Update(Rel4Zip) or Update(Rel4Email) or Update(Rel4HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel4'

If Update(Rel5FName) or Update(Rel5LName) or Update(Rel5Gender) or Update(Rel5DOB) or Update(Rel5Relationship) or Update(Rel5Add1) or Update(Rel5Add2) or Update(Rel5City) or Update(Rel5State) or Update(Rel5Zip) or Update(Rel5Email) or Update(Rel5HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel5'

If Update(Rel6FName) or Update(Rel6LName) or Update(Rel6Gender) or Update(Rel6DOB) or Update(Rel6Relationship) or Update(Rel6Add1) or Update(Rel6Add2) or Update(Rel6City) or Update(Rel6State) or Update(Rel6Zip) or Update(Rel6Email) or Update(Rel6HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel6'

If Update(Rel7FName) or Update(Rel7LName) or Update(Rel7Gender) or Update(Rel7DOB) or Update(Rel7Relationship) or Update(Rel7Add1) or Update(Rel7Add2) or Update(Rel7City) or Update(Rel7State) or Update(Rel7Zip) or Update(Rel7Email) or Update(Rel7HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel7'

If Update(Rel8FName) or Update(Rel8LName) or Update(Rel8Gender) or Update(Rel8DOB) or Update(Rel8Relationship) or Update(Rel8Add1) or Update(Rel8Add2) or Update(Rel8City) or Update(Rel8State) or Update(Rel8Zip) or Update(Rel8Email) or Update(Rel8HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel8'

If Update(Rel9FName) or Update(Rel9LName) or Update(Rel9Gender) or Update(Rel9DOB) or Update(Rel9Relationship) or Update(Rel9Add1) or Update(Rel9Add2) or Update(Rel9City) or Update(Rel9State) or Update(Rel9Zip) or Update(Rel9Email) or Update(Rel9HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel9'

If Update(Rel10FName) or Update(Rel10LName) or Update(Rel10Gender) or Update(Rel10DOB) or Update(Rel10Relationship)  or Update(Rel10Add1) or Update(Rel10Add2) or Update(Rel10City) or Update(Rel10State) or Update(Rel10Zip) or Update(Rel10Email) or Update(Rel10HomePhone)
	Exec MAPAdditionalContact @Agency, @user_id, 'Rel10'

If Update(Ref1FName) or Update(Ref1LName) or Update(Ref1Relationship) or Update(Ref1Add1) or Update(Ref1Add2) or Update(Ref1City) or Update(Ref1State) or Update(Ref1Zip) or Update(Ref1Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref1'

If Update(Ref2FName) or Update(Ref2LName) or Update(Ref2Relationship) or Update(Ref2Add1) or Update(Ref2Add2) or Update(Ref2City) or Update(Ref2State) or Update(Ref2Zip) or Update(Ref2Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref2'

If Update(Ref3FName) or Update(Ref3LName ) or Update(Ref3Relationship) or Update(Ref3Add1) or Update(Ref3Add2) or Update(Ref3City) or Update(Ref3State) or Update(Ref3Zip) or Update(Ref3Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref3'

If Update(Ref4FName) or Update(Ref4LName ) or Update(Ref4Relationship) or Update(Ref4Add1) or Update(Ref4Add2) or Update(Ref4City) or Update(Ref4State) or Update(Ref4Zip) or Update(Ref4Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref4'

If Update(Ref5FName) or Update(Ref5LName) or Update(Ref5Relationship) or Update(Ref5Add1) or Update(Ref5Add2) or Update(Ref5City) or Update(Ref5State) or Update(Ref5Zip) or Update(Ref5Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref5'

If Update(Ref6FName) or Update(Ref6LName) or Update(Ref6Relationship) or Update(Ref6Add1) or Update(Ref6Add2) or Update(Ref6City) or Update(Ref6State) or Update(Ref6Zip) or Update(Ref6Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref6'

If Update(Ref7FName) or Update(Ref7LName) or Update(Ref7Relationship) or Update(Ref7Add1) or Update(Ref7Add2) or Update(Ref7City) or Update(Ref7State) or Update(Ref7Zip) or Update(Ref7Email)
	Exec MAPAdditionalContact @Agency, @user_id, 'Ref7'

If Update(Emp1FName) or Update(Emp1LName) or Update(Emp1Relationship) or Update(Emp1Add1) or Update(Emp1Add2) or Update(Emp1City) or Update(Emp1State) or Update(Emp1Zip) or Update(Emp1Salary)
	Exec MAPAdditionalContact @Agency, @user_id, 'Emp1'

If Update(Emp2FName) or Update(Emp2LName) or Update(Emp2Relationship) or Update(Emp2Add1) or Update(Emp2Add2) or Update(Emp2City) or Update(Emp2State) or Update(Emp2Zip) or Update(Emp2Salary)
	Exec MAPAdditionalContact @Agency, @user_id, 'Emp2'

If Update(AP1Spouse) or Update(AP1MarriageStatus) or Update(AP1MarraigeDate) or Update(AP1TerminationDate) or Update(AP1TermReason)
	Exec MAPMarAddEdit @Agency, @user_id, 'Mar11'

If Update(AP1Spouse2) or Update(AP1MarriageStatus2) or Update(AP1MarraigeDate2) or Update(AP1TerminationDate2) or Update(AP1TermReason2)
	Exec MAPMarAddEdit @Agency, @user_id, 'Mar12'

If Update(AP2Spouse) or Update(AP2MarriageStatus) or Update(AP2MarraigeDate) or Update(AP2TerminationDate) or Update(AP2TermReason)
	Exec MAPMarAddEdit @Agency, @user_id, 'Mar21'

If Update(AP2Spouse2) or Update(AP2MarriageStatus2) or Update(AP2MarraigeDate2) or Update(AP2TerminationDate2) or Update(AP2TermReason2)
	Exec MAPMarAddEdit @Agency, @user_id, 'Mar22'


END
