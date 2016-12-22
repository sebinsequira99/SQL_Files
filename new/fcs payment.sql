

mapfcs..payment_description_master --23
mapfac_old_test..payment_description_master --64
mapfc_old_test..payment_description_master --13

information_schema.columns where column_name like '%category%id%'

mapfcs..formmaker_paymentItems
mapfc_old_test..formmaker_paymentItems
mapfac_old_test..formmaker_paymentItems

payment_description_master
formmaker_paymentItems

select * into mapfcs..payment_description_master_bk_141216 from mapfcs..payment_description_master
select * into mapfcs..formmaker_paymentItems_bk_141216 from mapfcs..formmaker_paymentItems
select * into mapfcs..formmaker_paymentdetails_bk_141216 from mapfcs..formmaker_paymentdetails
select * into mapfcs..payment_financial_data_bk_141216 from mapfcs..payment_financial_data

