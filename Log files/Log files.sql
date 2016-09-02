


--CASENOTE LISTING
http://mapat.myadoptionportal.com/map_shared/Logs/25/Casenote_Listing.log

--CASENOTE ACTIVITY LOG
exec usp_Getcaseworkeractivitylogs $connid,$connectionID

--PAYMENT ENTRY LOG
AT http://at.myadoptionportal.com/map_shared/Logs/25/paymentEntry_log.log
DILLON http://dillonadopt.myadoptionportal.com/map_shared/Logs/203/paymentEntry_log.log

--PAYMENT FLOW LOG
DILLON https://demo.myadoptionportal.com/map_shared/Logs/203/paymentFlow_log.log

--FINANCE PAYMENT TAB
select invoice_id,
      invoice_name,
      description,
      invoiceAmount,
      commission_amount,
      dueDate,
      left(convert(varchar,paidDate,110),10) as paidDate,
      reference,
      left(convert(varchar,expenseDate,110),10) as expenseDate,
      left(convert(varchar,createdDate,110),10) as createdDate,
      createdBy,
      invoiceTo,
      status,left(convert(varchar,actualDueDate,110),10) as actualDueDate,
      transaction_description,
      transaction_notes,
      e_check,
      crediCard,
      normal,already_in_qb,
      qb_control_number,
      updated_by, 
      left(convert(varchar,updated_date,110),10) as updated_date from payment_invoicemaster 
	  where (invoiceTo=$apUser or invoiceFrom=$apUser) 
	  and  connectionId = $apConnectionId  
	  and type='P' 
	  and (invoiceAmount !='0.00' or invoiceAmount !='0')

