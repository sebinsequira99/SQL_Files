


EXEC usp_GetInvoiceDetails
						   @user_id=8125
						  ,@user_type='agency'     --agency/agency_user
						  ,@caseworker_id=''
						  ,@user_name=''
						  ,@startrow='1'
						  ,@endrow='1000'



use rolesqa

GO
IF exists (select 1 from sys.objects where name='usp_GetInvoiceDetails' and type='p')
DROP PROCEDURE usp_GetInvoiceDetails;


GO
CREATE PROCEDURE usp_GetInvoiceDetails
(  
  @user_id				INT
, @user_type			VARCHAR(20)
, @caseworker_id		INT
, @user_name			VARCHAR(50)
, @startrow				INT
, @endrow				INT
)


AS
BEGIN


		CREATE TABLE #tbl_results				( id				INT IDENTITY(1,1)
												, user_id			INT
												, first_name		VARCHAR(100)
												, last_name			VARCHAR(100)
												, spouse_first_name	VARCHAR(100)
												, spouse_last_name	VARCHAR(100)
												, email				VARCHAR(100)
												, user_type			VARCHAR(100)
												, DisplayName		VARCHAR(100)
												, invoiceAmount1	DECIMAL(10,2)
												, invoiceAmount2	DECIMAL(10,2)
												, invoiceAmount3	DECIMAL(10,2)
												, invoiceAmount4	DECIMAL(10,2)
												, parentid			INT
												, caseworkerid		INT
												, cwname			VARCHAR(100))

		
CREATE TABLE #InvAmt	
	( 
		  id				INT IDENTITY(1,1)
		, invoiceTo			INT
		, invoiceAmount1	money
		, invoiceAmount2	money
		, invoiceAmount3	money
		, invoiceAmount4	money
	)


	 INSERT INTO #InvAmt(invoiceTo)	SELECT DISTINCT invoiceTo FROM payment_invoicemaster

UPDATE P1 SET P1.invoiceAmount1 = P.invoiceAmount1
FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount1,invoiceTo invoiceTo FROM payment_invoicemaster P 
	 WHERE (p.CreatedBY=@user_id ) AND P.app_status=0 AND p.type='E' AND p.invoiceTo!=1 AND p.invoiceFrom!=1
	Group BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

UPDATE P1 SET P1.invoiceAmount2=p.invoiceAmount2
	 FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount2,invoiceTo invoiceTo FROM payment_invoicemaster P 
	 WHERE  (p.CreatedBY=@user_id  ) AND type='P' and app_status=0 
	 Group BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

UPDATE P1 SET P1.invoiceAmount3=p.invoiceAmount3
	 FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount3,invoiceTo invoiceTo FROM payment_invoicemaster P 
	 WHERE (p.CreatedBY=@user_id  ) AND type='P' AND (p.status=0 OR p.status=1 OR p.status=2 OR p.status=3) AND app_status=0
	Group BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

UPDATE P1 SET P1.invoiceAmount4=p.invoiceAmount4
	 FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount4,invoiceTo invoiceTo FROM payment_invoicemaster P 
	 WHERE  (p.CreatedBY=@user_id  ) AND type='E' AND (p.status=0 OR p.status=1 OR p.status=2 OR p.status=3) AND app_status=0  
	Group BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

		IF (@user_type='agency')


		BEGIN
						
				INSERT INTO #tbl_results	( user_id	
											, first_name		
											, last_name			
											, spouse_first_name	
											, spouse_last_name	
											, email				
											, user_type			
											, DisplayName
											, invoiceAmount1
											, invoiceAmount2
											, invoiceAmount3
											, invoiceAmount4
											, parentid
											, caseworkerid
											, cwname)


				SELECT  ua.user_id
					   ,ua.first_name
					   ,ua.last_name
					   ,ua.spouse_first_name
					   ,ua.spouse_last_name
					   ,ua.email
					   ,ua.user_type
					   ,rolesqa.dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) as DisplayName
					   ,t.invoiceAmount1
					   ,t.invoiceAmount2
					   ,t.invoiceAmount3
					   ,t.invoiceAmount4
					   ,c.parentid
					   ,c.caseworkerid
					   ,ua1.first_name+' '+ ua1.last_name

				FROM user_accounts ua 
				JOIN #InvAmt t on (ua.user_id=t.invoiceto ) 
				JOIN caseworker_client c on c.parentid=ua.user_id
				JOIN user_accounts ua1 on ua1.user_id=c.caseworkerid 

				where (ua.status <> 'Delete'  OR ua.status IS NULL)
				AND (ua.user_type='adoptive_parent' or ua.user_type='birth_parent') 
				AND (@user_name='' OR (ua.first_name like '%'+ @user_name + '%' OR ua.last_name like '%'+ @user_name + '%'))							
				ORDER by ua.first_name ASC
					   
		END


		ELSE IF (@user_type='agency_user')

		BEGIN

				DECLARE @setting INT
				SELECT @setting=setting 
				FROM system_settings 
				where useroption=cast(@caseworker_id as varchar(10))+'_cw_cwsecurityfinancial'


				IF (@setting = 1 OR @setting = 2) 

				BEGIN											
								
						INSERT INTO #tbl_results( user_id	
												, first_name		
												, last_name			
												, spouse_first_name	
												, spouse_last_name	
												, email				
												, user_type)


						SELECT  ua.user_id
							   ,ua.first_name
							   ,ua.last_name
							   ,ua.spouse_first_name
							   ,ua.spouse_last_name
							   ,ua.email
							   ,ua.user_type

								FROM user_accounts ua   
								where ua.status <> 'Delete'AND 
								ua.agency_group in (select cast(agency_id as varchar(8000)) FROM user_agencies where user_id=@user_id)  
								AND 
								(ua.user_type='adoptive_parent' or ua.user_type='birth_parent') 
								AND 
								ua.user_id in (select invoiceTo from  payment_invoicemaster)
								AND 
								(@user_name='' OR (first_name like '%'+ @user_name + '%' OR last_name like '%'+ @user_name + '%'))  
								ORDER by ua.first_name ASC

				END

				 
				ELSE IF (@setting = 3 OR @setting = 4) 
				
				BEGIN
			
						SELECT ua.user_id
						,ua.first_name
						,ua.last_name
						,ua.spouse_first_name
						,ua.spouse_last_name
						,ua.email
						,ua.user_type
						,rolesqa.dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) AS DisplayName
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
						,ua1.first_name + ' '+ ua1.last_name as name 


						FROM user_accounts ua
						JOIN payment_invoicemaster p on ua.user_id=p.invoiceto
						JOIN caseworker_client c on c.parentid=ua.user_id
						JOIN user_accounts ua1 on ua1.user_id=c.caseworkerid 


						WHERE ua.user_id=@caseworker_id AND ua.STATUS <> 'Delete' 
						      AND(invoiceTo=@caseworker_id or invoiceFrom=@caseworker_id) 
							  AND (app_status=0 OR (p.status='6' AND app_status='1'))
						     AND EXISTS (SELECT 1 FROM  caseworker_client CW WHERE CW.caseworkerid=@caseworker_id AND CW.parentid=c.parentid)	
						      ORDER BY first_name ASC
				END


		END


		SELECT   SCOPE_IDENTITY() as total_count	
						, id
						, user_id	
						, first_name		
						, last_name			
						, spouse_first_name	
						, spouse_last_name	
						, email				
						, user_type			
						, DisplayName
						, invoiceAmount1
						, invoiceAmount2
						, invoiceAmount3
						, invoiceAmount4
						, parentid
						, caseworkerid
						, cwname
																

		FROM #tbl_results	

		WHERE (id>=@startrow AND id<=@endrow)
					   


END


