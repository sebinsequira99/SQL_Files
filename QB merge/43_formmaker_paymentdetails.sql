

insert into mapfcs..formmaker_paymentdetails(
payment_type_name
,payment_default_price
,payment_default_price_flg
,payment_category_id
,payment_subcategory_id
,payment_type
,page_id
,field_id
,pay_to_cairs
,payment_qb_line_item_id)
select payment_type_name
,payment_default_price
,payment_default_price_flg
,payment_category_id
,payment_subcategory_id
,payment_type
,page_id
,field_id
,pay_to_cairs
,payment_qb_line_item_id
from mapfac_old_test..formmaker_paymentdetails
where payment_id not in(
1823
,1824)
