



SELECT distinct   FinCo1.FullName  AS FinCo1FullName, FinCo1.State  AS FinCo1State, FinCo1.Email  AS FinCo1Email, FinCo2.FullName  AS FinCo2FullName, FinCo2.State  AS FinCo2State, FinCo2.Email  AS FinCo2Email, RptMAPFinancialDetail.PayCat  AS RptMAPFinancialDetailPayCat, RptMAPFinancialDetail.PaySubCat  AS RptMAPFinancialDetailPaySubCat, CONVERT(VARCHAR(10), RptMAPFinancialDetail.PayDate, 101) AS RptMAPFinancialDetailPayDate,RptMAPFinancialDetail.InvoiceAmt AS RptMAPFinancialDetailInvoiceAmt, RptMAPFinancialDetail.PayStatus  AS RptMAPFinancialDetailPayStatus, RptMAPFinancialDetail.PayType  AS RptMAPFinancialDetailPayType, RptMAPFinancialDetail.PayReference  AS RptMAPFinancialDetailPayReference, RptMAPFinancialDetail.Source  AS RptMAPFinancialDetailSource
FROM RptMAPFinancialDetail LEFT JOIN RptContact FinCo1 ON RptMAPFinancialDetail.MAPFinContactId1 = FinCo1.ContactId LEFT JOIN RptCIListDataAP Fin_CI_APInfo1 ON RptMAPFinancialDetail.MAPFinContactId1 = Fin_CI_APInfo1.ContactId LEFT JOIN RptContact FinCo2 ON RptMAPFinancialDetail.MAPFinContactId2 = FinCo2.ContactId LEFT JOIN RptCIListDataAP Fin_CI_APInfo2 ON RptMAPFinancialDetail.MAPFinContactId2 = Fin_CI_APInfo2.ContactId LEFT JOIN RptContact FinCW ON RptMAPFinancialDetail.MAPFinCWContactId1 = FinCW.ContactId LEFT JOIN RptCIListDataAP FinCW_CI_APInfo2 ON RptMAPFinancialDetail.MAPFinCWContactId1 = FinCW_CI_APInfo2.ContactId   WHERE  RptMAPFinancialDetail.PayStatus = 'Not Paid' 


RptMAPFinancialDetail where InvoiceAmt='$200.00' and PayStatus='Not Paid'
RptMAPFinancialDetail where InvoiceAmt='$1,000.00' and PayStatus='Not Paid'

contact where ContactId=61813
user_accounts where user_id=12725
payment_invoicemaster where invoice_Id=2336
rel_relationship where connectionId=328221