


select ua1.airs_contact_id,c.contactid,dbo.udf_CoupleContactId(ua1.ConnId, 2) From dbo.payment_invoicemaster pim
		left outer join dbo.user_accounts ua1 on pim.invoiceTo = ua1.[user_id]
		left outer join dbo.contact c on ua1.airs_contact_id = c.contactid
		where ua1.last_name='buttner'

contact where contactid in (91604,91605)


udf_CoupleContactId


Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE function [dbo].[udf_CoupleContactId] (
		@ConnId int,
		@Position int = 0)

Returns int as
BEGIN
	Declare @ConnectionID Varchar(1000),
			@RelCnt int,
			@TConnId int,
			@RConnId Varchar(1000)

		Set @ConnectionID = 0

	Select @ConnectionID = coalesce(ConnectionID,0)
		from dbo.rel_relationship R
		where ConnId = @ConnId
			and RelationshipTypeId < -2999 
			and RelationshipTypeId > -4000
			and (RelEndDate is null 
				or RelEndDate = '01/01/1900')
	
	If @ConnectionID = 0
		Set @ConnectionID = @ConnId

	if @Position = 0 or @Position = 1
		Select top 1 @TConnId = ConnId
			from dbo.rel_relationship R
				inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
			where ConnectionID = @ConnectionID
				and RelationshipSubTypeId = -3
			order by RelSeq asc, ConnectionPriority asc, RelationshipID
			
	else
		Begin	
			Select @RelCnt = count(1)
				from dbo.rel_relationship R
					inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
				where ConnectionID = @ConnectionID
					and RelationshipSubTypeId = -3

			If @RelCnt = 1
				Set @RConnId = '0'
			Else
				Begin
					Select top 1 @TConnId = ConnId
						from dbo.rel_relationship R
							inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
						where ConnectionID = @ConnectionID
							and RelationshipSubTypeId = -3
						order by RelSeq desc, ConnectionPriority desc, RelationshipID desc
					
				end
		end
		Set @TConnId = @TConnId * -1
		Set @RConnId = cast(@TConnId as varchar(1000))
		If @RConnId is Null and @Position < 2
			Set @RConnId = cast((@ConnId* -1) as varchar(1000))
		RETURN @RConnId
End

rel_relationship where ConnId = -91604

Select coalesce(ConnectionID,0)
		from dbo.rel_relationship R
		where ConnId = -70149
			and RelationshipTypeId < -2999 
			and RelationshipTypeId > -4000
			and (RelEndDate is null 
				or RelEndDate = '01/01/1900')

Select count(1)
from dbo.rel_relationship R
	inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 358474
	and RelationshipSubTypeId = -3

Select *
from dbo.rel_relationship R
	inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 362627
	and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc

Select *
from dbo.rel_relationship R
	inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 358474
	and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc

Select *
from dbo.rel_relationship R
	inner join dbo.Rel_lkp_RelationshipType RT on R.RelationshipTypeId = RT.RelationshipTypeId
where ConnectionID = 160406
	and RelationshipSubTypeId = -3
order by RelSeq desc, ConnectionPriority desc, RelationshipID desc