




use rolesqa
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


CREATE TABLE #agency					
		(	id					INT IDENTITY(1,1)
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
			, name				VARCHAR(100)
		)



CREATE TABLE #InvAmt	
	( 
		id					INT IDENTITY(1,1)
		, invoiceTo			INT
		, invoiceAmount1	money(8,4)
		, invoiceAmount2	money(8,4)
		, invoiceAmount3	money(8,4)
		, invoiceAmount4	money(8,4)
	)

	INSERT INTO #InvAmt(invoiceTo)	SELECT DISTINCT invoiceTo FROM payment_invoicemaster

UPDATE P1 SET P1.invoiceAmount1 = P.invoiceAmount1
FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount1,p.invoiceTo FROM payment_invoicemaster P 
	 WHERE (p.invoiceTo=8125 or p.invoiceFrom=8125) AND P.app_status=0 AND p.type='E' AND p.invoiceTo!=1 AND p.invoiceFrom!=1
	 GROUP BY p.invoiceTo) P ON P1.invoiceTo=P.invoiceTo

UPDATE P1 SET P1.invoiceAmount2=sum(p.invoiceAmount)
	 FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount2,p.invoiceTo FROM payment_invoicemaster P 
	 WHERE  (invoiceTo=@user_id or invoiceFrom=@user_id) AND type='P' and app_status=0 
	 GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

UPDATE P1 SET P1.invoiceAmount3=sum(p.invoiceAmount)
	 FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount3,p.invoiceTo FROM payment_invoicemaster P 
	 WHERE (invoiceTo=@user_id or invoiceFrom=@user_id) AND type='P' AND (p.status=0 OR p.status=1 OR p.status=2 OR p.status=3) AND app_status=0
	 GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo

UPDATE P1 SET P1.invoiceAmount4=sum(p.invoiceAmount)
	 FROM #InvAmt p1 INNER JOIN 	
	( SELECT sum(p.invoiceAmount) invoiceAmount4,p.invoiceTo FROM payment_invoicemaster P 
	 WHERE  (invoiceTo=@user_id or invoiceFrom=@user_id) AND type='E' AND (p.status=0 OR p.status=1 OR p.status=2 OR p.status=3) AND app_status=0  
	 GROUP BY invoiceTo) P ON P1.invoiceTo=P.invoiceTo








 
		IF (@user_type='agency')


		BEGIN
						
				INSERT INTO #agency	( user_id	
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
									, name)


				SELECT  ua.user_id
					   ,ua.first_name
					   ,ua.last_name
					   ,ua.spouse_first_name
					   ,ua.spouse_last_name
					   ,ua.email
					   ,ua.user_type
					   ,rolesqa.dbo.udf_CoupleName(ua.ConnId,1,1,'Unknown',0,0) as DisplayName
					   ,P1.invoiceAmount1
					   ,P1.invoiceAmount2
					   ,P1.invoiceAmount3
					   ,P1.invoiceAmount4
					   ,c.parentid
					   ,c.caseworkerid
					   ,ua1.first_name+' '+ ua1.last_name as cwname

						FROM user_accounts ua 
						JOIN #InvAmt p1 on ua.user_id=p1.invoiceto
						JOIN caseworker_client c on  parentid=ua.user_id
						JOIN user_accounts ua1 on ua1.user_id=c.caseworkerid 

						where ua.status <> 'Delete' 
						AND 
						(ua.agency_group in (select cast(agency_id as varchar(8000)) FROM user_agencies where user_id=@user_id)) 
						AND 
						(ua.user_type='adoptive_parent' or ua.user_type='birth_parent') 
						AND 
						(ua.user_id in (select invoiceTo from  payment_invoicemaster)) 
						AND
						(p1.status!='Delete') 
						AND 
						(@user_name='' OR (first_name like '%'+ @user_name + '%' OR last_name like '%'+ @user_name + '%'))
						ORDER by ua.first_name ASC


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
						, name
																

				FROM #agency	

				WHERE (id>=@startrow AND id<=@endrow)
					   
					   
		END


		ELSE IF (@user_type='agency_user')

		BEGIN

				DECLARE @setting INT
				SELECT @setting=setting 
				FROM system_settings 
				where useroption=cast(@caseworker_id as varchar(10))+'_cw_cwsecurityfinancial'


 

				IF (@setting = 1 OR @setting = 2) 

				BEGIN											
								
						INSERT INTO #cw	(     user_id	
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
								ua.agency_group in (select cast(agency_id as varchar(8000)) FROM user_agencies where user_id=@user_id)  
								AND 
								(ua.user_type='adoptive_parent' or ua.user_type='birth_parent') 
								AND 
								ua.user_id in (select invoiceTo from  payment_invoicemaster)
								AND 
								(@user_name='' OR (first_name like '%'+ @user_name + '%' OR last_name like '%'+ @user_name + '%'))  
								ORDER by ua.first_name ASC

						SELECT    SCOPE_IDENTITY() as total_count	
								, id
								, user_id	
								, first_name		
								, last_name			
								, spouse_first_name	
								, spouse_last_name	
								, email				
								, user_type										

						FROM #cw	

						WHERE (id>=@startrow AND id<=@endrow)
							 


				END


				ELSE IF (@setting = 3 OR @setting = 4) 
				
				BEGIN

						SELECT parentid FROM caseworker_client WHERE caseworkerid=@caseworker_id
			
						SELECT [user_id],[first_name],[last_name],[spouse_first_name],[spouse_last_name],[email]
						,[user_type],[rolesqa].[dbo].udf_CoupleName(ConnId,1,1,'Unknown',0,0) AS DisplayName 
						FROM user_accounts 
						WHERE user_id=@user_id and  STATUS <> 'Delete' ORDER BY first_name ASC
						
						SELECT [invoice_id],[invoice_name],[createdBy],[invoiceTo],[createdDate],[dueDate],[invoiceAmount]
						,[amountPaid],[paidDate],[netAmount],[status],[type],[alert] FROM [payment_invoicemaster] 
						WHERE ([invoiceTo]=@caseworker_id or [invoiceFrom]=@caseworker_id) and (app_status=0 OR (status='6' AND app_status='1'))
						
						SELECT [parentid],[caseworkerid],(SELECT first_name + ' '+ last_name 
						FROM user_accounts 
						WHERE user_id = caseworkerid  and STATUS !='Delete' ) AS name 
						FROM [caseworker_client] 
						WHERE parentid=@caseworker_id

				END


		END


END


--EXEC usp_GetInvoiceDetails
--						   @user_id=8125
--						  ,@user_type='agency'     --agency/agency_user
--						  ,@caseworker_id=''
--						  ,@user_name=''
--						  ,@startrow=0
--						  ,@endrow=100

