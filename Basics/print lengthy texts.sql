    
	
--print @SqlQry  

DECLARE @stmp VARCHAR(max) 

SET @stmp = Isnull(@SqlQry, '') 

WHILE @stmp <> '' 
  BEGIN 
      PRINT LEFT(@stmp, 1000) 

      SET @stmp = Substring(@stmp, 1001, Len(@stmp)) 
  END 
