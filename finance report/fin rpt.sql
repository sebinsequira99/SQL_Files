
--mapat
SELECT distinct   FinCo1.FullName  AS FinCo1FullName
, FinCo1.State  AS FinCo1State
, FinCo1.Email  AS FinCo1Email
, FinCo2.FullName  AS FinCo2FullName
, FinCo2.State  AS FinCo2State
, FinCo2.Email  AS FinCo2Email
, RptMAPFinancialDetail.PayCat  AS RptMAPFinancialDetailPayCat
, RptMAPFinancialDetail.PaySubCat  AS RptMAPFinancialDetailPaySubCat
, CONVERT(VARCHAR(10), RptMAPFinancialDetail.PayDate, 101) AS RptMAPFinancialDetailPayDate
,RptMAPFinancialDetail.InvoiceAmt AS RptMAPFinancialDetailInvoiceAmt
, RptMAPFinancialDetail.PayStatus  AS RptMAPFinancialDetailPayStatus
, RptMAPFinancialDetail.PayType  AS RptMAPFinancialDetailPayType
, RptMAPFinancialDetail.PayReference  AS RptMAPFinancialDetailPayReference
, RptMAPFinancialDetail.Source  AS RptMAPFinancialDetailSource
FROM RptMAPFinancialDetail 
LEFT JOIN RptContact FinCo1 
ON RptMAPFinancialDetail.MAPFinContactId1 = FinCo1.ContactId 
LEFT JOIN RptCIListDataAP Fin_CI_APInfo1 
ON RptMAPFinancialDetail.MAPFinContactId1 = Fin_CI_APInfo1.ContactId 
LEFT JOIN RptContact FinCo2 
ON RptMAPFinancialDetail.MAPFinContactId2 = FinCo2.ContactId 
LEFT JOIN RptCIListDataAP Fin_CI_APInfo2 
ON RptMAPFinancialDetail.MAPFinContactId2 = Fin_CI_APInfo2.ContactId 
LEFT JOIN RptContact FinCW 
ON RptMAPFinancialDetail.MAPFinCWContactId1 = FinCW.ContactId 
LEFT JOIN RptCIListDataAP FinCW_CI_APInfo2 
ON RptMAPFinancialDetail.MAPFinCWContactId1 = FinCW_CI_APInfo2.ContactId   
WHERE RptMAPFinancialDetail.PayDate BETWEEN '01/01/2015'  AND '12/31/2015'