

IF exists (select 1 from sys.objects where name='udf_Split_into_columns' and type='tf')
DROP FUNCTION udf_Split_into_columns;

GO

CREATE FUNCTION udf_Split_into_columns(@input AS Varchar(400) )

RETURNS
      @Result TABLE(qn VARCHAR(10)
				   ,ans VARCHAR(10))
AS
BEGIN

Declare @Sample Table
(qn_ans varchar(max))

INSERT INTO @Sample
VALUES 
(@input)

INSERT INTO @Result
  SELECT 
  Reverse(ParseName(Replace(Reverse(qn_ans), '_', '.'), 1)) As [qn]
 ,Reverse(ParseName(Replace(Reverse(qn_ans), '_', '.'), 2)) As [ans]

  FROM (Select qn_ans from @Sample
  ) As [x] 

  RETURN

END

SELECT * from udf_Split_into_columns('1_3');




