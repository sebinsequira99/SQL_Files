

mapat

drop table #xmldata_input,#loop

select 
user_id
,contactid
,connectionid
,connid
,scope
,program_id
,data_xml
,created_by
,created_at
,updated_by
,updated_at into #loop 
from library_customdata 
where cast(data_xml as nvarchar(max)) like '%ffsd%'

alter table #loop
add row_id int identity(1,1)

declare @xmldata_input xml
,@start_id int=1
,@end_id int
,@contactid int

select @end_id=max(row_id) from #loop

create table #xmldata_input(id int identity(1,1)
,contactid int
,InputFieldname nvarchar(max)
,InputFieldvalue nvarchar(max))

while(@start_id<=@end_id)
begin
select @xmldata_input=data_xml from #loop where row_id=@start_id
select @contactid=contactid from #loop where row_id=@start_id

 ;
 WITH xmldata_input
 AS 
 (
 SELECT [column].value('fn:local-name(.)', 'NVARCHAR(max)') as 'InputFieldname'
 ,[column].value('.', 'NVARCHAR(max)') as 'InputFieldvalue'
 FROM @xmldata_input.nodes('//.') as [table]([column])
 WHERE [column].value('fn:local-name(.)','nvarchar(max)')<>''
 )

insert into #xmldata_input(contactid 
,InputFieldname
,InputFieldvalue) 
select @contactid,InputFieldname,InputFieldvalue FROM xmldata_input

set @start_id=@start_id+1

end

SELECT 
* into #result
FROM
(SELECT * 
 FROM #xmldata_input) AS SourceTable
PIVOT
(
max(InputFieldvalue)
FOR InputFieldname IN 
(ffsdnocurrentpermanentresource_2244
,ffsdunannouncedvisit_2270
,ffsdgiftsotheritemspurchasedforyouth_2274
,ffsdrecruitmentefforts_2266
,ffsdhomestudyclearancesnotcompleted_2238
,ffsdhomestudynotapproved_2237
,ffsdchildnewcaseworker_2219
,ffsdreferraltofamilyfindinvestigator_2268
,ffsdreunificationfunds_2277
,ffsdworkingonweekends_2278
,ffsdcontinuedfamilyfindingefforts_2260
,ffsdchildnewaddressdate_2206
,ffsdcurrentstage_2213
,ffsdothertaskassigned_2271
,ffsdreferralforspecializedtherapy_2267
,ffsdyouthnotopentoadoption_2253
,ffsdformmonth_2196
,ffsdcreateecomapandgenogram_2258
,ffsdlegalstatus_2214
,ffsdformnochangesthismonth_2197
,ffsdtreatmentteammeetingscaseconsultation_2269
,ffsdpendingcourthearing_2246
,ffsdformupdatedate_2195
,ffsdtransportationproblems_2251
,ffsdcommunicationaboutpermanency_2259
,ffsddispositionofparentalrights_2234
,ffsdcurrentstatus_2212
,ffsdteamcommunicationproblems_2250
,ffsdchildcaretakerprovider_2203
,ffsddateofentryincare_2282
,ffsdchildsattorney_2217
,ffsdclosedstatus_3475
,ffsdchessieid_2199
,ffsdchildcontact_2211
,ffsdfamilyinvolvementmeetings_2262
,ffsddssattorney_2218
,ffsdreadyby21referral_2265
,ffsdsubstanceabuse_2249
,ffsdchildsgoal_2216
,ffsdlegaljuvenilejusticeinvolvement_2242
,ffsdcontactswithyouth_2231
,ffsddigitalme_2261
,ffsdnumberpreviousplacements_2283
,ffsdchildnarrative_2224
,ffsdicpc_2239
,ffsdvisitscontactsspecialistsandcollaterals_2232
,ffsddisruption_2236
,ffsdseveremedicaldevelopmentalchallenges_2247
,ffsdotheroutofpocketexpenses_2276
,ffsdothertaskassignedexplaination_2272
,ffsdparentneedsadditionalresourceshousing_2245
,ffsdseverepsychiatricchallenges_2248
,ffsdllcceremonyexpenses_2275
,ffsdopenstatus_3474
,ffsdbarriersotheer_2284
,ffsdlimitedfamilyinformation_2243
,ffsdexpectedplacementdate_2280
,ffsdvisitsspecialistwithresourceorpotentialresource_2226
,ffsdissueswithschoolplacement_2241
,ffsdblendedperspectivemeeting_2257
,ffsdletterssenttopotentialresources_2228
,ffsdvisitscontactsyouthandresource_2229
,ffsdvisitsyouthwithrelatives_2230
,ffsdgiftcards_2273
,ffsdcontactsspecialistwithresourceorpotentialresource_2227
,ffsdabsconded_2255
,ffsddispositionofparentalrights_2235
,ffsdchildhasnewaddress_2204
,ffsdplacementorlegalfinalizationexpectedforthiscase_2279
,ffsdissueswithplacementfosterparents_2240
,ffsdyouthhospitalizedbehavioralissues_2252
,ffsdiepschoolmeeting_2263
,ffsdtypeofplacement_2215
,ffsdvisitsspecialistwithyouth_2225
,ffsdmontlysuccessstory_2281
,ffsdotherbarrier_2254
,ffsdindividualtherapy_2264
)) AS PivotTable

select contactid
,max(ffsdnocurrentpermanentresource_2244)
,max(ffsdunannouncedvisit_2270)
,max(ffsdgiftsotheritemspurchasedforyouth_2274)
,max(ffsddssattorney_2218)
from #result
group by contactid