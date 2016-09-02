


use mapdev

SET ANSI_NULLS ON 
SET ANSI_PADDING ON 
SET QUOTED_IDENTIFIER ON 
SET ANSI_WARNINGS ON 
SET CONCAT_NULL_YIELDS_NULL ON 
SET ARITHABORT ON 
SET ANSI_NULL_DFLT_ON ON
EXEC SP_getAllContactInfo_mod 164,83967,'ALL'


sp_helptext SP_getAllContactInfo 


Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SP_getAllContactInfo_mod] 
    @CAccountKey varchar(MAX)= ' '
    ,@ContactId int
    ,@type varchar(MAX)= ''

AS
           
BEGIN
    DECLARE @strDBName VARCHAR(MAX)
    DECLARE @SelectString VARCHAR(MAX)

   /* finding agency according to CAccountKey*/

    IF ( @CAccountKey <>'' AND ISNUMERIC(@CAccountKey)=1)
 
  BEGIN 
    SELECT  DISTINCT @strDBName= '['+[DBName]+']' 
    FROM [IrrisCentral].[dbo].[lutPrimaryAgency] 
    WHERE SiteID=@CAccountKey
  END

  IF (@strDBName<>'')
  BEGIN 
  
  IF(@type='' OR @type='ALL')
  BEGIN
  /*Select data from coressponding agency contact table */
   
        SET @SelectString ='SELECT (SELECT CAST(co.FName AS VARCHAR(300))) AS FName
       ,(SELECT CAST(co.MName AS VARCHAR(300))) AS MName
       ,(SELECT CAST(co.LName AS VARCHAR(300))) AS LName
       ,(SELECT CAST(co.BusName AS VARCHAR(300))) AS BusName       
       ,co.BirthDate
       ,(SELECT CAST(co.Gender AS VARCHAR(300))) AS Gender
       ,(SELECT CAST(co.SSN AS VARCHAR(300))) AS SSN
       ,co.Title
       ,co.ContactNotes
       ,co.PlaceOfBirthCity
       ,ls.statename as birthstate
       ,lc.countryText as birthcountry
       ,co.DoNotSendMail
       ,(SELECT CAST(co.Nickname AS VARCHAR(300))) AS Nickname
	   ,co.BirthFirstName
	   ,co.BirthLastName
	   ,co.MaidenFirstName
	   ,co.MaidenLastName
	   ,co.MarriageFirstName
	   ,co.MarriageLastName
       ,(SELECT CAST(cm.ContactEmail AS VARCHAR(300))) AS ContactEmail
       ,(ISNULL((SELECT CAST(ca.Address1 AS VARCHAR(300)) AS Address1),'''') + '','' + ISNULL((SELECT CAST(ca.Address2 AS VARCHAR(300)) AS Address2),'''') +'',''+ ISNULL((SELECT CAST(ca.City AS VARCHAR(300)) AS City),'''') +'','' + ISNULL((SELECT CAST(ls.statename AS VARCHAR(300)) AS statename),'''')) as address
       ,(SELECT CAST(ca.Zip AS VARCHAR(300))) AS Zip
       ,(SELECT top 1 CAST(PhoneNumber AS VARCHAR(300)) AS PhoneNumber from ' +@strDBName+'.dbo.ContactPhone cp
        where cp.ContactID = co.contactid AND cp.PrimaryPhone= ''1''
        order by PrimaryPhone desc) as PrimaryPhone
       ,(Select top 1
         Case
          When cp1.PrimaryPhone = ''1'' then cp1.PhoneNumber + ''*''
          Else cp1.PhoneNumber
         End as HomePhone
        from ' +@strDBName+'.dbo.ContactPhone cp1
        where cp1.ContactID = co.contactid AND cp1.phonetypeid= 1
        order by PrimaryPhone desc) as HomePhone
       ,(Select top 1
         Case
          When cp1.PrimaryPhone = ''1'' then cp1.PhoneNumber + ''*''
          Else cp1.PhoneNumber
         End as HomePhone
        from ' +@strDBName+'.dbo.ContactPhone cp1
        where cp1.ContactID = co.contactid AND cp1.phonetypeid= 2
        order by PrimaryPhone desc) as WorkPhone
       ,(Select top 1
         Case
          When cp1.PrimaryPhone = ''1'' then cp1.PhoneNumber + ''*''
          Else cp1.PhoneNumber
         End as HomePhone
        from ' +@strDBName+'.dbo.ContactPhone cp1
        where cp1.ContactID = co.contactid AND cp1.phonetypeid= 3
        order by PrimaryPhone desc) as CellPhone
       ,(Select top 1 ReligionText
        from ' +@strDBName+'.dbo.Contactreligion cr
        inner join ' +@strDBName+'.dbo.lkpReligion lr on cr.ReligionId = lr.ReligionId
        where cr.ContactId = co.ContactId) as ReligionText
       ,(Select top 1 LanguageText
        from ' +@strDBName+'.dbo.contactlanguage cl
        inner join ' +@strDBName+'.dbo.lkpLanguage ll on cl.LanguageId = ll.LanguageId
        where cl.ContactId = co.ContactId) as LanguageText
       ,(Select top 1 NationalityText
        from ' +@strDBName+'.dbo.contactnationality cn
        inner join ' +@strDBName+'.dbo.lkpNationality ln on cn.NationalityID = ln.NationalityID
        where cn.ContactId = co.ContactId) as NationalityText
       ,(Select top 1 EthnicityTypeText
        from ' +@strDBName+'.dbo.ContactEthnicity ce
        inner join ' +@strDBName+'.dbo.lkpEthnicity le on ce.EthnicityId = le.EthnicityId
        where ce.ContactId = co.ContactId) as EthnicityTypeText
          ,co.contactId
          ,co.DateOfDeath
          ,(RIGHT(''00''+ convert(varchar(2), month(co.DateOfDeath)),2) + ''-'' + RIGHT(''00''+ convert(varchar(2), day(co.DateOfDeath)),2) + ''-'' + convert(varchar(4), year(co.DateOfDeath))) AS CDateOfDeath
          ,(RIGHT(''00''+ convert(varchar(2), month(co.BirthDate)),2) + ''-'' + RIGHT(''00''+ convert(varchar(2), day(co.BirthDate)),2) + ''-'' + convert(varchar(4), year(co.BirthDate))) AS CBirthDate  
      FROM 
        
       ' +@strDBName+'.[dbo].[Contact] co 
     LEFT JOIN ' +@strDBName+'.dbo.ContactEmail CM ON co.contactid=CM.ContactID and PrimaryEmail = ''1''
     LEFT JOIN ' +@strDBName+'.dbo.ContactAddress CA ON co.contactid=CA.ContactID and MailingAddress = ''1''
      LEFT JOIN ' +@strDBName+'.dbo.lkpState ls1 on ls1.StateID = CA.StateId
      LEFT JOIN ' +@strDBName+'.dbo.lkpState ls on co.PlaceOfBirthStateId=ls.stateid
      LEFT JOIN ' +@strDBName+'.dbo.lkpCountry lc on co.PlaceOfBirthCountryId =lc.countryid 
      
      WHERE co.ContactId='+cast(@ContactId as varchar(100));

   END
   ELSE IF(@type='ADDRESS')
   BEGIN
   SET @SelectString = 'SELECT
         AddressId,
         AddressTypeId,
         ContactId,
         (SELECT CAST(ca.Address1 AS VARCHAR(300))) AS Address1,
         (SELECT CAST(ca.Address2 AS VARCHAR(300))) AS Address2,
         (SELECT CAST(ca.City AS VARCHAR(300))) AS City,
         ca.StateId,
         ca.CountryId,
         ca.Countyid,
         (SELECT CAST(ca.Zip AS VARCHAR(300))) AS Zip,
         (SELECT CAST(ls.StateAbbreviation AS VARCHAR(300))) AS StateAbbreviation,
         (SELECT CAST(ls.StateName AS VARCHAR(300))) AS StateName,          
         (SELECT CAST(lc.CountryText AS VARCHAR(300))) AS CountryText,
         (SELECT CAST(lc.CountyText AS VARCHAR(300))) AS CountyText,
         AddStartDate,
         AddLeaveDate,
         MailingAddress,
         AddressProvinceID,
         ZipNumeric
        FROM ' +@strDBName+'.dbo.ContactAddress ca 

        LEFT JOIN ' +@strDBName+'.dbo.lkpState ls1 on  ca.StateId = ls1.StateID  
        LEFT JOIN ' +@strDBName+'.dbo.lkpCountry cs1 on ca.CountryId = cs1.CountryId  
        LEFT JOIN ' +@strDBName+'.dbo.lkpCounty cs2 on ca.CountyId = cs2.CountyId         

        WHERE ContactId='+cast(@ContactId as varchar(100))+'AND MailingAddress  = ''1''';
   END
   ELSE IF(@type='PHONE')
   BEGIN
    SET @SelectString ='SELECT
         ContactPhoneID,
         ContactID,
         PhoneTypeID,
         PrimaryPhone,
         (SELECT CAST(cp.PhoneNumber AS VARCHAR(300))) AS PhoneNumber
         FROM ' +@strDBName+'.dbo.ContactPhone cp
             WHERE ContactId='+cast(@ContactId as varchar(100));
   END    
    ELSE IF(@type='EMAIL')
   BEGIN
    SET @SelectString ='SELECT
         ContactEmailID,
         ContactId,
         EmailTypeID,
         (SELECT CAST(cm.ContactEmail AS VARCHAR(300))) AS ContactEmail,
         PrimaryEmail
         FROM ' +@strDBName+'.dbo.ContactEmail cm 
             WHERE ContactId='+cast(@ContactId as varchar(100));
   END    


   print @SelectString
   EXEC (@SelectString);
     
   
  END
  
END


