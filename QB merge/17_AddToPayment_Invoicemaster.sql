USE MAPFCAD_TEST
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
,createdBy+100000
,invoiceTo+100000
,invoiceFrom+100000
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

GO

SET IDENTITY_INSERT payment_invoicemaster OFF
GO
