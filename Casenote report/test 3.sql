


#CasenoteRpt_StgTbl where displayname='Howard, Lynda &amp; Walter'

#CasenoteRpt_StgTbl_sub where displayname='Howard, Lynda &amp; Walter'

CasenoteRpt_StgTbl where ClientName='Howard, Lynda &amp; Walter'
rel_relationship where contactid=2933
rel_relationship where connectionid in (118410,128352)
contactactivity where connid=-2933
usp_clientsearch
casenote_details_new
select top 100 connectionid,rellabel,* from rel_relationship where connectionid=rellabel
select distinct relationshiptypeid from rel_relationship where cast(connectionid as varchar(200))=rellabel
#CasenoteRpt_StgTbl where connectionid=345537
contactactivity where connectionid in (130985
,130987
,130989
,130991
,132028)

rel_relationship where connectionid in (130985
,130987
,130989
,130991
,132028)
contactactivity where connid=-41796
rel_relationship where displayname='Zukor, Kenneth &amp; Christina'
select dbo.udf_CoupleConnId(-41796,2)
select dbo.udf_CoupleConnectionId(-41796)
#CasenoteRpt_StgTbl where displayname='Zukor, Kenneth &amp; Christina'
#CasenoteRpt_StgTbl_sub where displayname='Zukor, Kenneth &amp; Christina'