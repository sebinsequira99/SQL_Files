USE MAPFACQB_STAGE
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'payment_invoicemaster'))    
BEGIN
ALTER TABLE payment_invoicemaster
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/

SET IDENTITY_INSERT payment_invoicemaster ON
GO

INSERT INTO payment_invoicemaster
(
invoice_id
,invoice_name
,description
,createdBy
,invoiceTo
,invoiceFrom
,expenseDate
,dueDate
,invoiceAmount
,amountPaid
,paidDate
,netAmount
,status
,type
,reference
,app_status
,alert
,item_id
,createdDate
,AgID
,CwID
,quickbooks_paymentid
,quickbook_expenseid
,quickbook_queue
,modifiedDate
,quickbook_receivepaymentid
,transaction_description
,transaction_notes
,status_Actual
,quickbook_inveditseq
,quickbook_receeditseq
,quickbook_billeditseq
,quickbook_invtaxlineid
,quickbook_recetaxlineid
,quickbook_billtaxlineid
,qb_payment_online
,qb_recpaymentid_online
,qb_expenseid_online
,e_check
,crediCard
,normal
,actualDueDate
,qb_control_number
,signature_image
,already_in_qb
,taskID
,stageID
,phaseID
,paymentMethod
,commission_amount
,connId
,connectionId
,pay_from
,event_id
,MigrFlg
,ConnectionFlg
,updated_date
,updated_by
,TransactionID
,invoiceFromConnID
,invoiceFromConnectionID
,ImportFlag
)

SELECT invoice_id
,invoice_name
,description
,CASE
	WHEN createdBy >=13433 THEN (createdBy+100000)
	ELSE createdBy
END
,CASE
	WHEN invoiceTo >=13433 THEN (invoiceTo+100000)
	ELSE invoiceTo
END
,CASE
	WHEN invoiceFrom >=13433 THEN (invoiceFrom+100000)
	ELSE invoiceFrom
END
,expenseDate
,dueDate
,invoiceAmount
,amountPaid
,paidDate
,netAmount
,status
,type
,reference
,app_status
,alert
,item_id
,createdDate
,AgID
,CwID
,quickbooks_paymentid
,quickbook_expenseid
,quickbook_queue
,modifiedDate
,quickbook_receivepaymentid
,transaction_description
,transaction_notes
,status_Actual
,quickbook_inveditseq
,quickbook_receeditseq
,quickbook_billeditseq
,quickbook_invtaxlineid
,quickbook_recetaxlineid
,quickbook_billtaxlineid
,qb_payment_online
,qb_recpaymentid_online
,qb_expenseid_online
,e_check
,crediCard
,normal
,actualDueDate
,qb_control_number
,signature_image
,already_in_qb
,taskID
,stageID
,phaseID
,paymentMethod
,commission_amount
,((connId*-1)+100000)*-1
,(connectionId+100000)
,pay_from
,event_id
,MigrFlg
,ConnectionFlg
,updated_date
,updated_by
,TransactionID
,invoiceFromConnID
,invoiceFromConnectionID
,'Y'
FROM MAPFAC.DBO.payment_invoicemaster
WHERE CONNID<-19389 
GO

SET IDENTITY_INSERT payment_invoicemaster OFF
GO

--12 rows

/****************************************************************************************************/
SELECT p.invoice_id,pim.invoice_id AS piminvoice_id,p.connid , pim.connid  AS pimconnid
INTO #TEMP 
FROM MAPFAC.DBO.payment_invoicemaster p
LEFT JOIN  payment_invoicemaster pim
ON p.invoice_id = pim.invoice_id AND p.connid = pim.connid
where p.CONNID>-19389

SET IDENTITY_INSERT payment_invoicemaster ON
GO

INSERT INTO payment_invoicemaster
(
invoice_id
,invoice_name
,description
,createdBy
,invoiceTo
,invoiceFrom
,expenseDate
,dueDate
,invoiceAmount
,amountPaid
,paidDate
,netAmount
,status
,type
,reference
,app_status
,alert
,item_id
,createdDate
,AgID
,CwID
,quickbooks_paymentid
,quickbook_expenseid
,quickbook_queue
,modifiedDate
,quickbook_receivepaymentid
,transaction_description
,transaction_notes
,status_Actual
,quickbook_inveditseq
,quickbook_receeditseq
,quickbook_billeditseq
,quickbook_invtaxlineid
,quickbook_recetaxlineid
,quickbook_billtaxlineid
,qb_payment_online
,qb_recpaymentid_online
,qb_expenseid_online
,e_check
,crediCard
,normal
,actualDueDate
,qb_control_number
,signature_image
,already_in_qb
,taskID
,stageID
,phaseID
,paymentMethod
,commission_amount
,connId
,connectionId
,pay_from
,event_id
,MigrFlg
,ConnectionFlg
,updated_date
,updated_by
,TransactionID
,invoiceFromConnID
,invoiceFromConnectionID
,ImportFlag
)
SELECT 
invoice_id
,invoice_name
,description
,createdBy
,invoiceTo
,invoiceFrom
,expenseDate
,dueDate
,invoiceAmount
,amountPaid
,paidDate
,netAmount
,status
,type
,reference
,app_status
,alert
,item_id
,createdDate
,AgID
,CwID
,quickbooks_paymentid
,quickbook_expenseid
,quickbook_queue
,modifiedDate
,quickbook_receivepaymentid
,transaction_description
,transaction_notes
,status_Actual
,quickbook_inveditseq
,quickbook_receeditseq
,quickbook_billeditseq
,quickbook_invtaxlineid
,quickbook_recetaxlineid
,quickbook_billtaxlineid
,qb_payment_online
,qb_recpaymentid_online
,qb_expenseid_online
,e_check
,crediCard
,normal
,actualDueDate
,qb_control_number
,signature_image
,already_in_qb
,taskID
,stageID
,phaseID
,paymentMethod
,commission_amount
,connId
,connectionId
,pay_from
,event_id
,MigrFlg
,ConnectionFlg
,updated_date
,updated_by
,TransactionID
,invoiceFromConnID
,invoiceFromConnectionID
,'Y'
 FROM MAPFAC.DBO.payment_invoicemaster 
 WHERE invoice_id IN (SELECT invoice_id FROM #TEMP WHERE INVOICE_ID IS NOT NULL AND piminvoice_id IS NULL)

 --76

 SET IDENTITY_INSERT payment_invoicemaster OFF
GO