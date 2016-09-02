USE MAPFCAD_TEST
GO

/******************************************Add column ImportFlag ************************************************/
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ImportFlag' AND Object_ID = Object_ID(N'payment_log'))    
BEGIN
ALTER TABLE payment_log
ADD ImportFlag VARCHAR(5)
END
GO
/********************************************************************************************************************/
INSERT INTO payment_log
(
modifiedBy
,modifiedData
,modifiedDate
,invoice_id
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
,check_number
,amount
,date
,quickbook_receivepaymentid
,transaction_description
,transaction_notes
,status_Actual
,qb_payment_online
,qb_recpaymentid_online
,qb_expenseid_online
,ImportFlag
)
SELECT p.modifiedBy+100000
,p.modifiedData
,p.modifiedDate
,p.invoice_id
,p.invoice_name
,p.description
,p.createdBy+100000
,p.invoiceTo+100000
,p.invoiceFrom+100000
,p.expenseDate
,p.dueDate
,p.invoiceAmount
,p.amountPaid
,p.paidDate
,p.netAmount
,p.status
,p.type
,p.reference
,p.app_status
,p.alert
,p.item_id
,p.createdDate
,p.AgID
,p.CwID
,p.quickbooks_paymentid
,p.quickbook_expenseid
,p.check_number
,p.amount
,p.date
,p.quickbook_receivepaymentid
,p.transaction_description
,p.transaction_notes
,p.status_Actual
,p.qb_payment_online
,p.qb_recpaymentid_online
,p.qb_expenseid_online
,'Y'
FROM MAPFAC.DBO.payment_log p
JOIN payment_invoicemaster pim
ON pim.invoice_id = p.invoice_id
WHERE pim.ImportFlag = 'Y'
