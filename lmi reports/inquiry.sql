

use maplmi

--sys.objects where name like '%inquiry%' and type='u'

--Inquiry
--inquiry_data
--inquiry_master
--InquiryDetail
--lkpInquiryType
--StgInquiryReport

IF exists (select 1 from sys.objects where name='StgTbl_InquiryRpt' and type='u')
DROP TABLE StgTbl_InquiryRpt;

SELECT i.inquiry_id
      ,i.agency_id
      ,i.user_type
      ,i.first_name
      ,i.last_name
      ,i.email_id
      ,i.user_id
	  ,id.inquiry_detail_id
	  ,id.field_name
	  ,id.field_value

INTO StgTbl_InquiryRpt
FROM inquiry_master I
LEFT JOIN inquiry_data ID
ON I.inquiry_id=ID.inquiry_id
AND ID.field_name like '%howdidyouhearaboutus%'

ALTER TABLE StgTbl_InquiryRpt
ADD contactid int
,fname varchar(200)
,lname varchar(200)
,displayname varchar(100) 
,connectionstatusid int
,connectionstatustext varchar(100)

UPDATE I
SET I.contactid=c.contactid
,I.fname=c.fname
,I.lname=c.lname
,I.displayname=CASE 
			   WHEN replace(r.displayname,'&amp;','&') is null 
			   THEN i.last_name + ', ' + i.first_name
			   ELSE replace(r.displayname,'&amp;','&')
			   END
,I.connectionstatusid=r.connectionstatusid

FROM StgTbl_InquiryRpt I
LEFT JOIN contact c
ON I.first_name=c.fname
AND I.last_name=c.lname
LEFT JOIN rel_relationship r
ON (r.contactid=c.contactid or r.contactid2=c.contactid)
and r.rellabel is not null and r.rellabel<>''

UPDATE I
SET I.connectionstatustext=case 
						   when l.connectionstatustext is null 
						   then 'Inquiry only' 
						   else l.connectionstatustext
						   end
FROM StgTbl_InquiryRpt I
LEFT JOIN lkpconnectionstatus l
ON i.connectionstatusid=l.connectionstatusid

alter table StgTbl_InquiryRpt
alter column field_value varchar(max)