

--CREATING FUNCTION FOR SPLITTING A COMMA SEPERATED STRING

IF exists (select 1 from sys.objects where name='udf_Split_into_rows' and type='tf')
DROP FUNCTION udf_Split_into_rows;

GO

CREATE FUNCTION udf_Split_into_rows(@input AS Varchar(max) )

RETURNS
      @Result TABLE(Value varchar(max))
AS
BEGIN
      DECLARE @str VARCHAR(max)
      DECLARE @index Int
      BEGIN
            SET @index = CharIndex(',',@input)
            WHILE @index > 0
            BEGIN
                  SET @str = SUBSTRING(@input,1,@index-1)
                  SET @input = SUBSTRING(@input,@index+1,LEN(@input)-@index)
                  INSERT INTO @Result 
				  VALUES (@str)
                  SET @index = CharIndex(',',@input)
            END
            SET @str = @input
            INSERT INTO @Result 
			values (@str)
      END
      RETURN
END

--SELECT value from udf_Split_into_rows('12,55,79,34,93');
