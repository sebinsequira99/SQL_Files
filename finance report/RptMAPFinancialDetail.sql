

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].RptMAPFinancialDetail') AND type in (N'U'))

DROP TABLE [dbo].RptMAPFinancialDetail
 
GO
	Declare	@SqlQry nvarchar(2500),
			@MAPDb Varchar(50),
			@SiteId Varchar(10),
			@IsRole Varchar(10)
	
	DECLARE @id int 
	DECLARE @DBName VARCHAR(200)
	DECLARE @Count int
		
	SELECT @DBName = db_name()
	EXEC @id = IRRISCENTRAL.DBO.usp_InsertReportJobLogs 'RptMAPFinancialDetail.sql',@DBName

 SELECT  DISTINCT @MAPDb= '['+MAPDBName+']',
					@SiteId = cast(SiteID as Varchar(10)),
					@IsRole = agencyFlag
 FROM [IrrisCentral].[dbo].[lutPrimaryAgency] 
 WHERE DBName = db_name()
   
If @IsRole = 'R'
	--Set @SqlQry = '
BEGIN	
		 

		 Select  ua1.airs_contact_id as MAPFinContactId1	
				,dbo.udf_CoupleContactId(ua1.ConnId, 2) as MAPFinContactId2
				,ua3.airs_contact_id as MAPFinCWContactId1
				,ua1.[user_id]
				,ua1.ConnId
				,invoice_name as PayCat
				,description as PaySubCat
				,expenseDate as ExpenceDate
				,CASE @DBName  WHEN 'MAPAT' THEN ISNULL(expenseDate,paidDate) ELSE ISNULL(paidDate,expenseDate)  END  as PayDate
				,'$' + convert(varchar,convert(money,invoiceAmount),1) as InvoiceAmt
				,Case pim.status
					WHEN 0 THEN 'Paid w/ECheck'
					WHEN 1 THEN 'Paid w/Credit Card'
					WHEN 2 THEN 'Paid w/Check'
					WHEN 3 THEN 'Paid w/Other'
					WHEN 4 THEN 'Not Paid'
					WHEN 5 THEN 'Not Notified'
					WHEN 6 THEN 'Payment Sent'
					WHEN 7 THEN 'Received Check'
					WHEN 8 THEN 'Paid Cash'
					WHEN 10 THEN 'Refund'
					WHEN 11 THEN 'Non-Cash Transactions'
					WHEN 12 THEN 'Over Payment'
				 ELSE 'Not Paid'
				 END as PayStatus
				,Case pim.[type]
					WHEN 'P' THEN 'Payment'
					WHEN 'E' THEN 'Expense'
				 ELSE 'Unknown'
				 END as PayType
				,CASE ISNULL(pim.reference,'') WHEN '' THEN vc.CheckNumber ELSE ISNULL(pim.reference,'') END as PayReference
				,c.FName+''+c.LName AS ContactName
				 ,'Invoice Id - ' + CAST(pim.invoice_id as VARCHAR(20)) AS Source
				 ,pim.invoice_id as 'invoiceId'
				 ,vc.CheckNumber as 'ChequeNumber'

		INTO RptMAPFinancialDetail

		From dbo.payment_invoicemaster pim
		left join payment_vCheck vc on pim.invoice_id=vc.invoiceId
		left outer join dbo.user_accounts ua1 on pim.invoiceTo = ua1.[user_id]
		left outer join dbo.user_agencies uag on ua1.agency_id = uag.agency_id
		left outer join dbo.user_accounts ua2 on pim.AgID = ua2.[user_id]
		left outer join dbo.user_accounts ua3 on pim.invoiceFrom = ua3.[user_id]
		left outer join dbo.contact c		  on ua1.airs_contact_id = c.contactid


		where uag.c_account_key = (select top 1 SiteID
									from IrrisCentral.dbo.lutPrimaryAgency
									where DBName = db_name())	

--Modified script

		ALTER TABLE RptMAPFinancialDetail
		ADD RelationshipTypeText varchar(100)
		
		UPDATE rm
		SET rm.RelationshipTypeText=rt.RelationshipTypeText
		FROM RptMAPFinancialDetail rm
		LEFT JOIN rel_relationship r 
		ON rm.[user_id]=r.[user_id]
		LEFT JOIN rel_lkp_relationshiptype rt 
		ON r.RelationshipTypeId=rt.RelationshipTypeId
		WHERE r.RelationshipTypeId in (-3003,-3002)
		
		UPDATE rm
		SET rm.MAPFinContactId2=CASE 
									 WHEN rm.RelationshipTypeText='Husband' 
									 THEN dbo.udf_CoupleContactId(rm.ConnId, 1) 
									 WHEN rm.RelationshipTypeText='Wife' 
									 THEN dbo.udf_CoupleContactId(rm.ConnId, 2) 
									 ELSE dbo.udf_CoupleContactId(rm.ConnId, 2)
								END
		FROM RptMAPFinancialDetail rm
		
										
END

If @IsRole = 'M'
BEGIN
	
				Select ua1.airs_contact_id as MAPFinContactId1	
				,dbo.udf_ContactIDs(ua1.airs_contactairs_id, 2) as MAPFinContactId2
				,ua3.airs_contact_id as MAPFinCWContactId1
				,invoice_name as PayCat
				,description as PaySubCat
				,expenseDate as ExpenceDate
				,CASE @DBName  WHEN 'MAPAT' THEN ISNULL(expenseDate,paidDate) ELSE ISNULL(paidDate,expenseDate)  END  as PayDate
				,'$' + convert(varchar,convert(money,invoiceAmount),1) as InvoiceAmt
				,Case pim.status
					WHEN 0 THEN 'Paid w/ECheck'
					WHEN 1 THEN 'Paid w/Credit Card'
					WHEN 2 THEN 'Paid w/Check'
					WHEN 3 THEN 'Paid w/Other'
					WHEN 4 THEN 'Not Paid'
					WHEN 5 THEN 'Not Notified'
					WHEN 6 THEN 'Payment Sent'
					WHEN 7 THEN 'Received Check'
					WHEN 8 THEN 'Paid Cash'
					WHEN 10 THEN 'Refund'
					WHEN 11 THEN 'Non-Cash Transactions'
					WHEN 12 THEN 'Over Payment'
				ELSE 'Not Paid'
				END as PayStatus
				,Case pim.[type]
					WHEN 'P' THEN 'Payment'
					WHEN 'E' THEN 'Expense'
				ELSE 'Unknown'
				END as PayType
				,CASE ISNULL(pim.reference,'') WHEN '' THEN vc.CheckNumber ELSE ISNULL(pim.reference,'') END as PayReference
				,c.FName+''+c.LName AS ContactName
				,'Invoice Id - ' + CAST(pim.invoice_id as VARCHAR(20)) AS Source
				 ,pim.invoice_id as 'invoiceId'
				 ,vc.CheckNumber as 'ChequeNumber'
		INTO RptMAPFinancialDetail
		
		From dbo.payment_invoicemaster pim
		left join payment_vCheck vc on pim.invoice_id=vc.invoiceId
		left outer join dbo.user_accounts ua1 on pim.invoiceTo = ua1.[user_id]
		left outer join dbo.user_agencies uag on ua1.agency_id = uag.agency_id
		left outer join dbo.user_accounts ua2 on pim.AgID = ua2.[user_id]
		left outer join dbo.user_accounts ua3 on pim.CwID = ua3.[user_id]
		left outer join dbo.contact c		  on ua1.airs_contact_id = c.contactid
		where uag.c_account_key = (select top 1 SiteID
									from IrrisCentral.dbo.lutPrimaryAgency
									where DBName = db_name())	
		
END									
	

SELECT @Count = Count(1) FROM RptMAPFinancialDetail
EXEC IRRISCENTRAL.DBO.[usp_UpdateReportJobLogs] @id,@Count

