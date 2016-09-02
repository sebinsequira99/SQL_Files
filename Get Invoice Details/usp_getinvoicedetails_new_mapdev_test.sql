




use mapdev
use rolesqa

select user_type from user_accounts where user_id=8125

/*Agency*/
SELECT ua.[user_id],ua.[first_name],ua.[last_name],ua.[spouse_first_name],ua.[spouse_last_name],ua.[email],ua.[user_type]
,[rolesqa].[dbo].udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) as DisplayName
FROM user_accounts ua   where ua.status <> 'Delete' AND 
ua.agency_group in (select cast(agency_id as varchar(8000)) FROM user_agencies where user_id=8125) and 
(ua.user_type='adoptive_parent' or ua.user_type='birth_parent') AND 
ua.user_id in (select invoiceTo from  payment_invoicemaster)  ORDER by ua.first_name ASC

/*CW
"5287_cw_cwsecurityfinancial"
"8125_ag_cwsecurityfinancial"
*/

SELECT [useroption],[setting]  FROM [system_settings] where useroption='16477_cw_cwsecurityfinancial'


/*Secutity 1 -2 */
SELECT [user_id],[first_name],[last_name],[spouse_first_name],[spouse_last_name],[email],[user_type] FROM user_accounts where status <> 'Delete' AND
agency_group in (select cast(agency_id as varchar(8000)) FROM user_agencies where user_id=16477) and (user_type='adoptive_parent' or user_type='birth_parent')
 ORDER by first_name ASC

/*Secutity 3 -4 */

select parentid from caseworker_client where caseworkerid=16477

if (security == 1 || security == 2) {
       client = user_id;
}
else if (security == 3 || security == 4) {
       client   =   parentid
}


SELECT [user_id],[first_name],[last_name],[spouse_first_name],[spouse_last_name],[email],[user_type]
,[rolesqa].[dbo].udf_CoupleName(ConnId,1,1,'Unknown',0,0) as DisplayName FROM 
 user_accounts where user_id=16864 and  status <> 'Delete' ORDER by first_name ASC

SELECT  [invoice_id],[invoice_name],[createdBy],[invoiceTo],[createdDate],[dueDate],[invoiceAmount],[amountPaid],[paidDate],[netAmount],[status],[type],[alert] 
FROM [payment_invoicemaster] 
 where ([invoiceTo]=17071 or [invoiceFrom]=17071) and (app_status=0 OR (status='6' AND app_status='1'))

SELECT [parentid],[caseworkerid],(SELECT first_name + ' '+ last_name FROM user_accounts where user_id = caseworkerid  and status !='Delete' ) as name 
FROM [caseworker_client] where parentid=  17071

/*sub querys for Agency */
SELECT  sum([invoiceAmount]) as invoiceAmount  FROM [payment_invoicemaster] where( [invoiceTo]=13650 or [invoiceFrom]=13650 )and app_status=0 AND type='E'
 AND [invoiceTo]!=1 AND [invoiceFrom]!=1
SELECT  sum([invoiceAmount]) as invoiceAmount  FROM [payment_invoicemaster] where( [invoiceTo]=13650 or [invoiceFrom]=13650 ) AND type='P'
 and app_status=0
SELECT   sum([invoiceAmount]) as invoiceAmount  FROM [payment_invoicemaster] where( [invoiceTo]=13650 or [invoiceFrom]=13650 ) AND type='P' 
AND (status=0 OR status=1 OR status=2 OR status=3) AND app_status=0
SELECT   sum([invoiceAmount]) as invoiceAmount  FROM [payment_invoicemaster] where( [invoiceTo]=13650 or [invoiceFrom]=13650 ) AND type='E'
 AND (status=0 OR status=1 OR status=2 OR status=3) AND app_status=0

SELECT [parentid],[caseworkerid],  (SELECT  first_name+ ' '+ last_name FROM user_accounts where user_id = caseworkerid  and status !='Delete' ) as name
 FROM [caseworker_client] where parentid=  17071


 5333
 9413

select * from caseworker_client where caseworkerid=9413

select user_type from user_accounts where user_id=17169


				SELECT * FROM system_settings
				where useroption like '%' + '_cw_cwsecurityfinancial' + '%'
				and setting in (1,2)

				SELECT setting
				FROM system_settings
				where useroption='17169_cw_cwsecurityfinancial'

				select * from #tbl_tempresultscw_sub
				drop table #tbl_tempresultscw_sub
					SELECT		 ua.user_id
								,ua.first_name
								,ua.last_name
								,ua.spouse_first_name
								,ua.spouse_last_name
								,ua.email
								,ua.user_type
								,dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) AS DisplayName
								,p.invoice_id
								,p.invoice_name
								,p.createdBy
								,p.invoiceTo
								,p.createdDate
								,p.dueDate
								,p.invoiceAmount
								,p.amountPaid
								,p.paidDate
								,p.netAmount
								,p.status
								,p.type
								,p.alert
								,c.parentid
								,c.caseworkerid
								,ua1.first_name + ' '+ ua1.last_name as cwname into #tbl_tempresultscw
								
						FROM user_accounts ua
						JOIN payment_invoicemaster p on ua.user_id=p.invoiceto
						LEFT JOIN caseworker_client c on c.parentid=ua.user_id
					    LEFT JOIN user_accounts ua1 on ua1.user_id=c.caseworkerid 


						WHERE ua.user_id=9413 and ua.STATUS <> 'Delete' 
						      AND(invoiceTo=9413 or invoiceFrom=9413) 
							  AND (p.app_status=0 OR (p.status='6' AND p.app_status='1'))

						   --   ORDER BY			
							  --CASE WHEN @OrderBy ='Client'	AND  @OrderByDirection = 'D'
							  --	THEN ua.last_name END DESC,
							  --CASE WHEN @OrderBy ='Client' AND  @OrderByDirection = 'A'
							  --	THEN ua.last_name END ASC,
							  --CASE WHEN @OrderBy ='CaseWorker'	AND  @OrderByDirection = 'D'
							  --	THEN (ua1.first_name + ' '+ ua1.last_name) END DESC,
							  --CASE WHEN @OrderBy ='CaseWorker' AND  @OrderByDirection = 'A'
							  --	THEN (ua1.first_name + ' '+ ua1.last_name) END ASC

				SELECT	DISTINCT ts.user_id
								,ts.first_name 
								,ts.last_name
								,ts.spouse_first_name
								,ts.spouse_last_name
								,ts.email
								,ts.user_type
								,ts.DisplayName
								,ts.invoice_id
								,ts.invoice_name
								,ts.createdBy
								,ts.invoiceTo
								,ts.createdDate
								,ts.dueDate
								,ts.invoiceAmount
								,ts.amountPaid
								,ts.paidDate
								,ts.netAmount
								,ts.status
								,ts.type
								,ts.alert
								,ts.parentid
								--,ts.caseworkerid
								,STUFF((SELECT distinct ',' + ts1.cwname
								 FROM #tbl_tempresultscw ts1
								 WHERE ts.user_id = ts1.user_id
								 FOR XML PATH('')
								 ,TYPE).value('.', 'NVARCHAR(MAX)')
								 ,1,1,'') cwname into #tbl_tempresultscw_sub
								 
				FROM #tbl_tempresultscw ts	

