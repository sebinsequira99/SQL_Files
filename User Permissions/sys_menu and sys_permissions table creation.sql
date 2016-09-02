





--CREATING SYS_MENU TABLE
--=========================


USE rolesqa


IF exists (select 1 from sys.objects where name='sys_menu' and type='u')
DROP TABLE sys_menu;

CREATE TABLE sys_menu
(
 menuid				int			not null identity(1,1)
,menu_name			Varchar(50)	not null
,parent_menu_id		int			not null
,deletedyn			bit			not null
,CreatedBy			int			not null
,CreatedDate		datetime
,LastModifiedBy		int	
,LastModifiedDate	datetime
						
);


--ADDING PRIMARY KEYS
--========================

IF exists (select 1 from sys.objects where name='PK_tbl_sys_menu_menuid' and type='pk')
ALTER table sys_menu
DROP constraint PK_tbl_sys_menu_menuid;

ALTER TABLE sys_menu
ADD CONSTRAINT PK_tbl_sys_menu_menuid primary key(menuid);






--ADDING FOREIGN KEYS
--========================



IF exists (select 1 from sys.objects where name='FK_sys_menu_CreatedBy' and type='f')
ALTER table sys_menu
DROP CONSTRAINT FK_sys_menu_CreatedBy;

ALTER TABLE sys_menu
ADD CONSTRAINT FK_sys_menu_CreatedBy foreign key(CreatedBy)
REFERENCES user_accounts(user_id);


IF exists (select 1 from sys.objects where name='FK_sys_menu_LastModifiedBy' and type='f')
ALTER table sys_menu
DROP CONSTRAINT FK_sys_menu_LastModifiedBy;

ALTER TABLE sys_menu
ADD CONSTRAINT FK_sys_menu_LastModifiedBy foreign key(LastModifiedBy)
REFERENCES user_accounts(user_id);




--ADDING DEFAULT CONSTRAINTS
--==============================

IF exists (select 1 from sys.objects where name='DF_tbl_sys_menu_CreatedDate' and type='d')
ALTER table sys_menu
DROP constraint DF_tbl_sys_menu_CreatedDate;

ALTER TABLE sys_menu
ADD CONSTRAINT DF_tbl_sys_menu_CreatedDate DEFAULT getdate()
FOR CreatedDate;



IF exists (select 1 from sys.objects where name='DF_tbl_sys_menu_deletedyn' and type='d')
ALTER table sys_menu
DROP constraint DF_tbl_sys_menu_deletedyn;

ALTER TABLE sys_menu
ADD CONSTRAINT DF_tbl_sys_menu_deletedyn DEFAULT 0
FOR deletedyn;




--CREATING SYS_PERMISSIONS TABLE
--================================

IF exists (select 1 from sys.objects where name='sys_permissions' and type='u')
DROP TABLE sys_permissions;

CREATE TABLE sys_permissions
(
 userid				int			
,group_id			int			
,menuid				int			not null
,enabledyn			bit			not null
,isgroup			bit			not null
,CreatedBy			int			not null
,CreatedDate		datetime	
,LastModifiedBy		int	
,LastModifiedDate	datetime
);	




--ADDING FOREIGN KEYS
--========================

IF exists (select 1 from sys.objects where name='FK_sys_permissions_menuid' and type='f')
ALTER table sys_permissions
DROP CONSTRAINT FK_sys_permissions_menuid;

ALTER TABLE sys_permissions
ADD CONSTRAINT FK_sys_permissions_menuid foreign key(menuid)
REFERENCES sys_menu(menuid);


IF exists (select 1 from sys.objects where name='FK_sys_permissions_CreatedBy' and type='f')
ALTER table sys_permissions
DROP CONSTRAINT FK_sys_permissions_CreatedBy;

ALTER TABLE sys_permissions
ADD CONSTRAINT FK_sys_permissions_CreatedBy foreign key(CreatedBy)
REFERENCES user_accounts(user_id);


IF exists (select 1 from sys.objects where name='FK_sys_permissions_LastModifiedBy' and type='f')
ALTER table sys_permissions
DROP CONSTRAINT FK_sys_permissions_LastModifiedBy;

ALTER TABLE sys_permissions
ADD CONSTRAINT FK_sys_permissions_LastModifiedBy foreign key(LastModifiedBy)
REFERENCES user_accounts(user_id);



--ADDING DEFAULT CONSTRAINTS
--==============================


IF exists (select 1 from sys.objects where name='DF_tbl_sys_permissions_CreatedDate' and type='d')
ALTER table sys_permissions
DROP constraint DF_tbl_sys_permissions_CreatedDate;

ALTER TABLE sys_permissions
ADD CONSTRAINT DF_tbl_sys_permissions_CreatedDate DEFAULT getdate()
FOR CreatedDate;


IF exists (select 1 from sys.objects where name='DF_tbl_sys_permissions_enabledyn' and type='d')
ALTER table sys_permissions
DROP constraint DF_tbl_sys_permissions_enabledyn;

ALTER TABLE sys_permissions
ADD CONSTRAINT DF_tbl_sys_permissions_enabledyn DEFAULT 0
FOR enabledyn;
