


mapaoi..user_accounts where group_id like '%879%' and last_login<'2015-05-01'

mapaoi..user_groups


maplmi..formmaker_properties where form_id=2720

maplmi..formmaker_pages where form_id=2720

maplmi..formmaker_fields where page_id=6513

maplmi..formmaker_30_homestudyagencyinformation


select replace(r.displayname,'amp;','') as [Family]
	  ,f.input_agencyname as [Name of Agency (other than Little Miracles) providing services in your adoption process]
	  ,f.input_agadd as [Agency Address]
	  ,f.input_csz as [City State Zip Code]
	  ,f.input_contactper as [Agency contact person]
	  ,f.input_agphno as [Agency phone number]
	  ,f.input_subuscis as [If you have completed home study, has it been submitted to USCIS?]
	  ,f.input_reflmi as [If you do not have a placing or home study agency, would you like referral from LMI?]
	  ,f.input_agencyrole as [The above named agency is our:]
	  ,f.input_accredited as [Is the agency Accredited (Hague or Universal)?]
from maplmi..formmaker_30_homestudyagencyinformation f
left join maplmi..rel_relationship r
on f.connectionid=r.connectionid
and (abs(f.connid)=r.contactid or abs(f.connid)=r.contactid2)
where replace(r.displayname,'amp;','') is not null
order by [Family]



