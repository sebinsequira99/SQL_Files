

--exec usp_GetInvoiceDetails 257,'adoptive_parent'

CREATE PROCEDURE usp_GetInvoiceDetails
(  
  @user_id				INT
, @user_type			VARCHAR(20)
, @user_name			VARCHAR(100)=''
, @Caseworker			VARCHAR(100)=''
, @startrow				INT=1
, @endrow				INT=100
, @OrderBy				VARCHAR(50)=''
, @OrderByDirection		VARCHAR(10)=''
)


AS

SET NOCOUNT ON;
BEGIN

		DECLARE @login_user VARCHAR(20)
		SELECT @login_user=user_type from user_accounts where user_id=@user_id

		CREATE TABLE #tbl_tempresults	( user_id			INT
										, first_name		VARCHAR(100)
										, last_name			VARCHAR(100)
										, spouse_first_name	VARCHAR(100)
										, spouse_last_name	VARCHAR(100)
										, email				VARCHAR(100)
										, user_type			VARCHAR(100)
										, DisplayName		VARCHAR(100)
										, Expenses			DECIMAL(10,2)
										, Payments			DECIMAL(10,2)
										, Paid				DECIMAL(10,2)
										, Pending_Balance	DECIMAL(10,2)
										, parentid			INT
										, caseworkerid		INT
										, cwname			VARCHAR(max))

											
		CREATE TABLE #tbl_tempresults_sub	( id				INT IDENTITY(1,1)
											, user_id			INT
											, first_name		VARCHAR(100)
											, last_name			VARCHAR(100)
											, spouse_first_name	VARCHAR(100)
											, spouse_last_name	VARCHAR(100)
											, email				VARCHAR(100)
											, user_type			VARCHAR(100)
											, DisplayName		VARCHAR(100)
											, Expenses			DECIMAL(10,2)
											, Payments			DECIMAL(10,2)
											, Paid				DECIMAL(10,2)
											, Pending_Balance	DECIMAL(10,2)
											, parentid			INT
											, caseworkerid		INT
											, cwname			VARCHAR(max)
											, invoice_id		INT
											, invoice_name		VARCHAR(100)
											, description		VARCHAR(200)
											, reference			VARCHAR(200)
											, createdBy			INT
											, invoiceTo			INT
											, invoicefrom		INT
											, createdDate		DATETIME
											, dueDate			INT
											, paidDate			DATETIME
											, status			INT
											, status_detail		VARCHAR(100)
											, type				VARCHAR(100)
											, alert				INT)

		CREATE TABLE #InvAmount	
			( 
				  id				INT IDENTITY(1,1)
				, invoiceTo			INT
				, Expenses			MONEY
				, Payments			MONEY
				, Paid				MONEY
				, Pending_Balance	MONEY
			)

		set ansi_warnings off
		
		INSERT INTO #InvAmount(invoiceTo)	SELECT DISTINCT invoiceTo FROM payment_invoicemaster
		
		UPDATE P1 SET P1.Expenses = P.Expenses
			FROM #InvAmount p1 INNER JOIN 	
			( SELECT sum(p.invoiceAmount) Expenses,invoiceTo invoiceTo FROM payment_invoicemaster P 
			  WHERE P.app_status=0 AND P.type='E' AND p.invoiceTo!=1 AND p.invoiceFrom!=1
			  GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo
		
		UPDATE P1 SET P1.Payments=p.Payments
			 FROM #InvAmount p1 INNER JOIN 	
			( SELECT sum(p.invoiceAmount) Payments,invoiceTo invoiceTo FROM payment_invoicemaster P 
			  WHERE P.type='P' and P.app_status=0 
			  GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo
		
		UPDATE P1 SET P1.Paid=p.Paid
			 FROM #InvAmount p1 INNER JOIN 	
			( SELECT sum(p.invoiceAmount) Paid,invoiceTo invoiceTo FROM payment_invoicemaster P 
			  WHERE P.type='P' AND (p.status in(0,1,2,3,8,12)) AND P.app_status=0
			  GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo
		
		UPDATE P1 SET P1.Pending_Balance=p.Pending_Balance
			 FROM #InvAmount p1 INNER JOIN 	
			( SELECT sum(p.invoiceAmount) Pending_Balance,invoiceTo invoiceTo FROM payment_invoicemaster P 
			  WHERE P.type='P' AND (p.status not in (0,1,2,3,8,12)) AND P.app_status=0  
			  GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

		set ansi_warnings on

		IF (@login_user='agency')


				BEGIN

						INSERT INTO #tbl_tempresults( user_id	
													, first_name		
													, last_name			
													, spouse_first_name	
													, spouse_last_name	
													, email				
													, user_type			
													, DisplayName
													, Expenses
													, Payments
													, Paid
													, Pending_Balance
													, parentid
													, caseworkerid
													, cwname)

						SELECT	 ua.user_id
								,ua.first_name
								,ua.last_name
								,ua.spouse_first_name
								,ua.spouse_last_name
								,ua.email
								,ua.user_type
								,dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) as DisplayName
								,t.Expenses
								,t.Payments
								,t.Paid
								,t.Pending_Balance
								,c.parentid
								,c.caseworkerid
								,ua1.first_name + ' '+ ua1.last_name as cwname

						FROM user_accounts ua 
						JOIN #InvAmount t on (ua.user_id=t.invoiceto ) 
						LEFT JOIN caseworker_client c on c.parentid=ua.user_id
						LEFT JOIN user_accounts ua1 on ua1.user_id=c.caseworkerid 

						WHERE (ua.status <> 'Delete'  OR ua.status IS NULL)
						AND (ua.user_type=@user_type) 
						
						INSERT INTO #tbl_tempresults_sub( user_id	
														, first_name		
														, last_name			 
														, spouse_first_name	
														, spouse_last_name	
														, email				
														, user_type			
														, DisplayName
														, Expenses
														, Payments
														, Paid
														, Pending_Balance
														, parentid
														--,caseworkerid
														, cwname)

						SELECT * FROM ( 
						SELECT	DISTINCT tt.user_id
										,tt.first_name 
										,tt.last_name
										,tt.spouse_first_name
										,tt.spouse_last_name
										,tt.email
										,tt.user_type
										,tt.DisplayName
										,tt.Expenses
										,tt.Payments
										,tt.Paid
										,tt.Pending_Balance
										,tt.parentid
										--,tt.caseworkerid
										,STUFF((SELECT distinct ',' + tt1.cwname
										 FROM #tbl_tempresults tt1
										 WHERE tt.user_id = tt1.user_id
										 FOR XML PATH('')
										 ,TYPE).value('.', 'NVARCHAR(MAX)')
										 ,1,1,'') cwname	 

						FROM #tbl_tempresults tt	

						WHERE (@user_name='' OR (tt.DisplayName like '%'+ @user_name + '%')) 
								AND (@Caseworker='' OR (STUFF((SELECT distinct ',' + tt1.cwname
														FROM #tbl_tempresults tt1
														WHERE tt.user_id = tt1.user_id
														FOR XML PATH('')
														,TYPE).value('.', 'NVARCHAR(MAX)')
														,1,1,'') 
														like '%'+ @Caseworker + '%'))) K

						ORDER BY			
						CASE WHEN @OrderBy ='Client' AND @OrderByDirection = 'D'
							 THEN K.DisplayName END DESC,
						CASE WHEN @OrderBy ='Client' AND @OrderByDirection = 'A'
							 THEN K.DisplayName END ASC,
						CASE WHEN @OrderBy ='CaseWorker' AND @OrderByDirection = 'D'
							 THEN K.cwname END DESC,
						CASE WHEN @OrderBy ='CaseWorker' AND @OrderByDirection = 'A'
							 THEN K.cwname END ASC,
						CASE WHEN @OrderBy ='Expenses' AND @OrderByDirection ='D'
							 THEN K.Expenses END DESC,
						CASE WHEN @OrderBy ='Expenses' AND @OrderByDirection = 'A'
							 THEN K.Expenses END ASC,
						CASE WHEN @OrderBy ='Payments' AND @OrderByDirection = 'D'
							 THEN K.Payments END DESC,
						CASE WHEN @OrderBy ='Payments' AND @OrderByDirection = 'A'
							 THEN K.Payments END ASC,
						CASE WHEN @OrderBy ='Paid' AND @OrderByDirection = 'D'
							 THEN K.Paid END DESC,
						CASE WHEN @OrderBy ='Paid' AND @OrderByDirection = 'A'
							 THEN K.Paid END ASC,
						CASE WHEN @OrderBy ='PendingBalance' AND @OrderByDirection = 'D'
							 THEN K.Pending_Balance END DESC,
						CASE WHEN @OrderBy ='PendingBalance' AND @OrderByDirection = 'A'
							 THEN K.Pending_Balance END ASC
							   
				END

				ELSE IF(@login_user='agency_user')

				BEGIN

						DECLARE @setting INT
						SELECT @setting=setting 
						FROM system_settings 
						where useroption=cast(@user_id as varchar(10))+'_cw_cwsecurityfinancial'


						IF (@setting = 1 OR @setting = 2) 

						BEGIN											
										
								INSERT INTO #tbl_tempresults_sub( user_id	
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
										where ua.status <> 'Delete' 
										AND 
										(ua.user_type=@user_type) 
										AND 
										ua.user_id in (select invoiceTo from  payment_invoicemaster)
										AND 
										(@user_name='' OR (first_name like '%'+ @user_name + '%' 
															OR last_name like '%'+ @user_name + '%'
															OR spouse_first_name like '%'+ @user_name + '%'
															OR spouse_last_name like '%'+ @user_name + '%'))  

										ORDER BY			
										CASE WHEN @OrderBy ='Client'	AND  @OrderByDirection = 'D'
											THEN last_name END DESC,
										CASE WHEN @OrderBy ='Client' AND  @OrderByDirection = 'A'
											THEN last_name END ASC

						END

						 
						ELSE IF (@setting = 3 OR @setting = 4) 
						
						BEGIN
								
								
								INSERT INTO #tbl_tempresults_sub( user_id	
																, first_name		
																, last_name			
																, spouse_first_name	
																, spouse_last_name	
																, email				
																, user_type			
																, DisplayName
																, Payments
																, Paid
																, Pending_Balance
																, invoice_id	
																, invoice_name	
																, createdBy		
																, invoiceTo	
																, invoicefrom	
																, createdDate	
																, dueDate		
																, paidDate		
																, status		
																, type			
																, alert)			

								SELECT * FROM(
								SELECT		 ua.user_id
											,ua.first_name
											,ua.last_name
											,ua.spouse_first_name
											,ua.spouse_last_name
											,ua.email
											,ua.user_type
											,dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) AS DisplayName
											,p.invoiceAmount
											,p.amountPaid
											,p.netAmount
											,p.invoice_id
											,p.invoice_name
											,p.createdBy
											,p.invoiceTo
											,p.invoicefrom
											,p.createdDate
											,p.dueDate
											,p.paidDate
											,p.status
											,p.type
											,p.alert

								FROM user_accounts ua
								JOIN payment_invoicemaster p on ua.user_id=p.invoiceto

								WHERE ua.user_id=@user_id and ua.STATUS <> 'Delete' 
								      AND(invoiceTo=@user_id or invoiceFrom=@user_id) 
									  AND (p.app_status=0 OR (p.status='6' AND p.app_status='1')))g

								ORDER BY			
								CASE WHEN @OrderBy ='Client'	AND  @OrderByDirection = 'D'
								THEN g.DisplayName END DESC,
								CASE WHEN @OrderBy ='Client' AND  @OrderByDirection = 'A'
								THEN g.DisplayName END ASC

							END


					END


			 IF (@login_user='adoptive_parent')

			 BEGIN


								INSERT INTO #tbl_tempresults_sub( user_id	
																, first_name		
																, last_name			
																, spouse_first_name	
																, spouse_last_name	
																, email				
																, user_type			
																, DisplayName
																, Payments
																, Paid
																, Pending_Balance
																, invoice_id	
																, invoice_name
																, description	
																, reference			
																, createdBy		
																, invoiceTo	
																, invoicefrom	
																, createdDate	
																, dueDate		
																, paidDate		
																, status
																, status_detail		
																, type			
																, alert)			


			 
								SELECT		 ua.user_id
											,ua.first_name
											,ua.last_name
											,ua.spouse_first_name
											,ua.spouse_last_name
											,ua.email
											,ua.user_type
											,dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) AS DisplayName
											,p.invoiceAmount
											,p.amountPaid
											,p.netAmount
											,p.invoice_id
											,p.invoice_name
											,p.description
											,p.reference
											,p.createdBy
											,p.invoiceTo
											,p.invoicefrom
											,p.createdDate
											,p.dueDate
											,p.paidDate
											,p.status
											,(CASE
												WHEN p.status=0  THEN 'Paid w/ECheck'
												WHEN p.status=1  THEN 'Paid w/Credit Card'
												WHEN p.status=2  THEN 'Paid w/Check'
												WHEN p.status=3  THEN 'Paid w/Other'
												WHEN p.status=4  THEN 'Not Paid'
												WHEN p.status=5  THEN 'Not Notified'
												WHEN p.status=6  THEN 'Payment Sent'
												WHEN p.status=7  THEN 'Received Check'
												WHEN p.status=8  THEN 'Paid Cash'
												WHEN p.status=10 THEN 'Refund'
												WHEN p.status=12 THEN 'Over Payment'
											 END)
											,p.type
											,p.alert
											--,c.parentid
											--,c.caseworkerid
											--,ua1.first_name + ' '+ ua1.last_name as cwname 

								FROM user_accounts ua
								JOIN payment_invoicemaster p on ua.user_id=p.invoiceto
								--LEFT JOIN caseworker_client c on c.parentid=ua.user_id
							    --LEFT JOIN user_accounts ua1 on ua1.user_id=c.caseworkerid 


								WHERE ua.user_id=@user_id and ua.STATUS <> 'Delete' 
								      AND(invoiceTo=@user_id or invoiceFrom=@user_id) 
									  AND (p.app_status=0 OR (p.status='6' AND p.app_status='1'))


			 END

			
			 SELECT SCOPE_IDENTITY() as total_count	
					, tt1.id
					, tt1.user_id	
					, tt1.first_name		
					, tt1.last_name			
					, tt1.spouse_first_name	
					, tt1.spouse_last_name	
					, tt1.email				
					, tt1.user_type			
					, tt1.DisplayName
					, tt1.Expenses
					, tt1.Payments
					, tt1.Paid
					, tt1.Pending_Balance
					, tt1.parentid
					--, tt1.caseworkerid
					, tt1.cwname
					, tt1.invoice_id	
					, tt1.invoice_name
					, tt1.description
					, tt1.reference	
					, tt1.createdBy		
					, tt1.invoiceTo		
					, tt1.invoicefrom	
					, tt1.createdDate	
					, tt1.dueDate		
					, tt1.paidDate		
					, tt1.status
					, tt1.status_detail		
					, tt1.type			
					, tt1.alert			
															
			
			 FROM #tbl_tempresults_sub	tt1
			
			 WHERE (tt1.id>=@startrow AND tt1.id<=@endrow)

	
					   

END



