

--list of agencies with missing fields

--use AAIMERGE   --agency_id=28
--use MAPABI     --agency_id=39
--use MAPAT	     --agency_id=25
--use MAPCCD	 --agency_id=81
--use MAPGoL	 --agency_id=34
--use MAPifi	 --agency_id=76
--use MAPLMI	 --agency_id=30
--use MAPLSSMT   --agency_id=66
--use MAPMAPSW   --agency_id=170
--use MAPPAA	 --agency_id=215
--use MAPS	     --agency_id=170

--creating backup

SELECT * INTO formmaker_fields_16_06_2015 FROM formmaker_fields
 
SELECT * into cilisttemplateitem_16_06_2015 FROM cilisttemplateitem

SELECT * into CILISTITEM_16_06_2015 FROM CILISTITEM


--to add missing fields

ALTER TABLE Missinglibraryfields_11_06_15
ADD ID int identity(1,1)

DECLARE @min int
DECLARE @max int
DECLARE @Fieldid INT 

SET @min = 1
SELECT @max = MAX(ID) FROM Missinglibraryfields_11_06_15


WHILE(@min<=@max)
BEGIN
		SELECT @Fieldid = Field_ID FROM Missinglibraryfields_11_06_15 WHERE id = @min
		EXEC SP_AddLibraryField @agency_id,@Fieldid
		SET @min = @min+1
END




