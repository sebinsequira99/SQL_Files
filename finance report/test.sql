

mapat

RptMAPFinancialDetail where MAPFinContactId1=MAPFinContactId2 
AND (RelationshipTypeText='Husband' or RelationshipTypeText='Wife')


payment_invoicemaster_bak_090315
payment_invoicemaster_bak2_09_03_15


RptMAPFinancialDetail where RelationshipTypeText='Husband' or RelationshipTypeText='Wife'

contact where contactid=1533


RptMAPFinancialDetail where invoiceid=7223 or invoiceid=7578


payment_invoicemaster where invoice_id=3324 or invoice_id=7578

payment_vCheck where invoiceId=7528 or invoiceId=7578


17070
15577


select * from contact where contactid in (58445
,58444
,62674
,65600)

select * from user_accounts where user_id in (24640)

select dbo.udf_CoupleContactId(-62674, 1) 


select dbo.udf_CoupleContactId(-2939, 1) 
select dbo.udf_CoupleContactId(-2939, 2) 


select dbo.udf_CoupleContactId(-65600, 1) 
select dbo.udf_CoupleContactId(-65600, 2) 


select *
from
user_accounts where connid in (-58445
,-58444
,-62674
,-65600)

-66640
-69375

contact where contactid=66639
contact where contactid=69374

select dbo.udf_CoupleContactId(-69375, 1) 
select dbo.udf_CoupleContactId(-69375, 2) 


        select rt.RelationshipTypeText,*
		FROM rel_relationship r 
		LEFT JOIN rel_lkp_relationshiptype rt 
		ON r.RelationshipTypeId=rt.RelationshipTypeId
		WHERE r.RelationshipTypeId in (-3003,-3002) and r.user_id=17070

		select rt.RelationshipTypeText,*
		FROM rel_relationship r 
		LEFT JOIN rel_lkp_relationshiptype rt 
		ON r.RelationshipTypeId=rt.RelationshipTypeId
		WHERE r.RelationshipTypeId in (-3003,-3002) and r.user_id=13040

		UPDATE rm
		SET rm.MAPFinContactId2=CASE 
									 WHEN rm.RelationshipTypeText='Husband' 
									 THEN dbo.udf_CoupleContactId(rm.ConnId, 1) 
									 WHEN rm.RelationshipTypeText='Wife' 
									 THEN dbo.udf_CoupleContactId(rm.ConnId, 2) 
									 ELSE dbo.udf_CoupleContactId(rm.ConnId, 2)
								END
		FROM RptMAPFinancialDetail rm




Select r.DisplayName,r.RelationshipTypeId,rt.RelationshipTypeText,*
from dbo.rel_relationship R
inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 107737
and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc


Select r.DisplayName,r.RelationshipTypeId,rt.RelationshipTypeText,*
from dbo.rel_relationship R
inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 108241
and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc


update rel_relationship
set RelationshipTypeId=-3004
where RelationshipID in(
108242
,108241)


Select r.DisplayName,r.RelationshipTypeId,rt.RelationshipTypeText,*
from dbo.rel_relationship R
	inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 106352
	and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc


Select r.DisplayName,r.RelationshipTypeId,rt.RelationshipTypeText,*
from dbo.rel_relationship R
	inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 107044
	and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc