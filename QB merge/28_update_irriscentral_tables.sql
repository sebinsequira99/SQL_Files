

--backups
--irriscentral..map_user_agencies_bk_150916 
--irriscentral..map_user_accounts_bk_150916
--irriscentral..lutprimaryagency_bk_150916

--update irriscentral..map_user_agencies 
--set user_id=100000+user_id
--,map_agency_id=234
--where map_agency_id=17 

--update irriscentral..map_user_agencies 
--set map_agency_id=234
--where map_agency_id=227 

--update irriscentral..lutprimaryagency 
--set dbname=NULL
--,mapdbname=NULL
--,airsdb=NULL
--where mapdbname in('mapfc','mapfac')

