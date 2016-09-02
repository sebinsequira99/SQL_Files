

--For new agencies , take copy of MAPBaselineMerge DB

INSERT INTO [IRRISCentral].[dbo].[lutPrimaryAgency]
           ([SiteAbbrev]
           ,[PrimaryAgencyID]
           ,[PrimaryAgencyName]
           ,[PrimaryAgencyDescription]
           ,[Contact1]
           ,[Contact2]
           ,[AcctUser]
           ,[AcctPassword]
           ,[FTPUser]
           ,[FTPPassword]
           ,[AIRSUser]
           ,[AIRSPassword]
           ,[DBName]
           ,[DBUser]
           ,[DBPassword]
           ,[DBServer]
           ,[DBDriveMap]
           ,[DSN]
           ,[DomainName]
           ,[DomainIP]
           ,[AccessProject]
           ,[AccessConfigFile]
           ,[logo]
           ,[LicenseCount]
           ,[GMTOffset]
           ,[LicensePurchase]
           ,[EmailServer]
           ,[EmailUser]
           ,[EmailPSW]
           ,[EmailBlastServer]
           ,[EmailBlastUser]
           ,[EmailBlastPSW]
           ,[ReportDBServer]
           ,[ReportDBName]
           ,[ReportDBUser]
           ,[ReportDBPassword]
           ,[ReportDBSiteID]
           ,[isBackButtonOn]
           ,[isSaveEmailBlast]
           ,[isPopReaderOn]
           ,[PopUserName]
           ,[PopPassword]
           ,[isHTMLReportManager]
           ,[isSiteDBBanner]
           ,[SSLExpiration]
           ,[isDomesticAdoption]
           ,[isIntlAdoption]
           ,[isFosterCare]
           ,[isProductionDB]
           ,[ErrorPassThruIP]
           ,[ContractRenewalMonth]
           ,[AirsLite]
           ,[SecureSite]
           ,[isObsolete]
           ,[NonAirsSite]
           ,[UserDataSize]
           ,[UpdateSQL]
           ,[DBSize]
           ,[version]
           ,[VersionUpdateDate]
           ,[VersionUpdatedBy]
           ,[DateAdded]
           ,[OrigServer]
           ,[subDomain]
           ,[agencyFlag]
           ,[MAPDBName]
           ,[AIRSDB])
     VALUES
           ('SDC_FS'
           ,'SDC_FS'
           ,'SDC FORM SYSTEM'
           ,null
           ,'DBA'
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,'MAPSDC_FS'
           ,'sa'
           ,'I4GotIt'
           ,null
           ,null
           ,null
           ,'ctmapuat01'
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,0
           ,1
           ,0
           ,null
           ,null
           ,0
           ,0
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,1
           ,0
           ,1
           ,0
           ,0
           ,null
           ,1
           ,null
           ,null
           ,null
           ,null
           ,null
           ,null
           ,'ctmapuat01.myadoptionportal.com'
           ,'R'
           ,'MAPSDC_FS'
           ,'MAPSDC_FS')
GO


SELECT * FROM irriscentral.dbo.lutPrimaryAgency  WHERE  MAPDBName='MAPSDC_FS'

SELECT * FROM irriscentral.dbo.lutPrimaryAgency  WHERE  Siteid = 236

update irriscentral.dbo.lutPrimaryAgency
set map_agency_id=236
WHERE  Siteid = 236

--use newDB

select * from user_accounts where user_type='agency'

Insert Into irriscentral.dbo.map_user_accounts (map_username, map_password, map_encryption)
Select 'admin@sdcfs.com','zdHmytKv49jMndHf3Ljd1aDZ4sfJoKKn','Y'

SELECT TOP (1) *
FROM irriscentral.dbo.map_user_accounts Where map_username='admin@sdcfs.com'

Insert Into irriscentral.dbo.map_user_agencies
Select 850643,236,8125,'Active'

SELECT TOP(1) *
FROM irriscentral.dbo.map_user_agencies Where Map_agency_id=236

update user_accounts 
set username='admin@sdcfs.com'
,email='admin@sdcfs.com'
where user_type='agency'

UPDATE user_agencies
SET email_id='admin@sdcfs.com'
,email_id_for_notifications='admin@sdcfs.com'

UPDATE user_accounts 
set agency_id = 0 
where user_type='admin'

UPDATE user_agencies 
set mainRecord = 1
where  user_id=(select user_id from user_accounts where username='admin@sdcfs.com')