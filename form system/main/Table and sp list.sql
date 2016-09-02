

--Tables

--1) forms
--2) form_data
--3) library_master
--4) library_systemdata
--5) library_customdata
--6) lkpdetails
--7) lkpgender
--8) Fam_RelationshipType
--9) Relations_FormSystem 

--SP's

--1) udf_Split_into_rows
--2) usp_Edit_Contact_Details
--3) usp_GetLibraryData
--4) usp_printform_mapping
--5) usp_UpdateContact_OnFormSave
--6) usp_UpdateLibraryData
--7) USP_ViewMAPDataGroup
--8) usp_GetRptSubformData
--9) usp_RptTblCreation
--10) usp_UpdateRptSubformTbl
--11) usp_UpdateRptSubformTbl_Data
--12) Usp_GetRelations_FormSystem (Generate script from object explorer)
--13) usp_UpdateAgeDetails

--Functions
--1) qfn_XmlToJson
--2) qfn_JsonEscape

--Changes

--alter table rel_lkp_relationshiptype
--add isunlocked varchar(10)

--ALTER TABLE rel_lkp_relationshiptype 
--ADD  CONSTRAINT df_rel_lkp_relationshiptype_isunlocked
--DEFAULT (0) FOR isunlocked

--update rel_lkp_relationshiptype
--set isunlocked=0
