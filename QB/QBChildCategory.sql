

--CREATING QBChildCategory TABLE
--=================================

USE MAPFACQB

IF exists (select 1 from sys.objects where name='QBChildCategory' and type='u')
DROP TABLE QBChildCategory;

CREATE TABLE QBChildCategory
(
 QBChildCategoryId	INT	     NOT NULL IDENTITY(1,1)
,ParentConnId		INT      
,ChildConnId		INT	     
,ConnectionId		INT	     
,CategoryId			INT	     
,CreatedBY		    INT		 NOT NULL
,CreatedDate	    DATETIME NOT NULL
,ModifiedBY		    INT			 
,ModifiedDate	    DATETIME	 
);

--DEFAULT
IF EXISTS (SELECT 1 FROM sys.objects WHERE name='DF_QBChildCategory_CreatedDate' AND type='d')
ALTER TABLE QBChildCategory
DROP CONSTRAINT DF_QBChildCategory_CreatedDate;

ALTER TABLE QBChildCategory
ADD CONSTRAINT DF_QBChildCategory_CreatedDate
DEFAULT getdate()
FOR CreatedDate;

--PK
IF EXISTS (SELECT 1 FROM sys.objects WHERE name='PK_QBChildCategory_QBChildCategoryId' AND type='pk')
ALTER TABLE QBChildCategory
DROP CONSTRAINT PK_QBChildCategory_QBChildCategoryId;

ALTER TABLE QBChildCategory
ADD CONSTRAINT PK_QBChildCategory_QBChildCategoryId 
PRIMARY KEY(QBChildCategoryId);



