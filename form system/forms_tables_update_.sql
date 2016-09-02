use MAPTEST;


CREATE TABLE [dbo].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_name] [nvarchar](max) NOT NULL,
	[definition_json] [nvarchar](max) NOT NULL,
	[definition_draft_json] [nvarchar](max) NOT NULL,
	[is_subform] [bit] NOT NULL CONSTRAINT [DF_forms_is_subform]  DEFAULT ((0)),
	[definition_xml] [xml] NULL,
	[created_by] [int]  NULL,
	[created_at] [datetime]  NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[form_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[connid] [int] NOT NULL,
	[connectionid] [int] NOT NULL,
	[data_xml] [xml]  NULL,
	[created_by] [int]  NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_form_data_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[form_data]  WITH CHECK ADD  CONSTRAINT [FK_forms_data_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[form_data] CHECK CONSTRAINT [FK_forms_data_user_accounts_cb]
GO

ALTER TABLE [dbo].[form_data]  WITH CHECK ADD  CONSTRAINT [FK_forms_data_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[form_data] CHECK CONSTRAINT [FK_forms_data_user_accounts_ub]
GO

ALTER TABLE [dbo].[form_data]  WITH CHECK ADD  CONSTRAINT [FK_forms_data_user_accounts_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[form_data] CHECK CONSTRAINT [FK_forms_data_user_accounts_user_id]
GO


CREATE TABLE [dbo].[library_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_name] [varchar](200) NOT NULL,
	[library_desc] [varchar](255)  NULL,
	[isSystem] [bit]  NULL,
	[scope] [int]  NULL,
	[program_id] [int] NULL,
	[created_by] [int]  NULL,
	[created_at] [datetime]  NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	
	[controltype] [char](1)  NULL,
	[datatype] [varchar](20) NULL,
	[fieldsize] [int] NULL,
	
	
	[field_json] [nvarchar](max) NULL,
 CONSTRAINT [PK_library_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[library_master]  WITH CHECK ADD  CONSTRAINT [FK_library_master_relationshiptype_programid] FOREIGN KEY([program_id])
REFERENCES [dbo].[Rel_lkp_RelationshipType] ([RelationshipTypeId])
GO

ALTER TABLE [dbo].[library_master] CHECK CONSTRAINT [FK_library_master_relationshiptype_programid]
GO

ALTER TABLE [dbo].[library_master]  WITH CHECK ADD  CONSTRAINT [FK_library_master_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_master] CHECK CONSTRAINT [FK_library_master_user_accounts_cb]
GO

ALTER TABLE [dbo].[library_master]  WITH CHECK ADD  CONSTRAINT [FK_library_master_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_master] CHECK CONSTRAINT [FK_library_master_user_accounts_ub]
GO

CREATE TABLE [dbo].[library_customdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[contactid] [int] NOT NULL,
	[connectionid] [int] NULL,
	[connid] [int] NULL,
	[scope] [int] null,
	[program_id] [int] NULL,
	[data_xml] [xml] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_customdata_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[library_customdata]  WITH CHECK ADD  CONSTRAINT [FK_library_customdata_Contact_ContactID] FOREIGN KEY([contactid])
REFERENCES [dbo].[Contact] ([ContactId])
GO

ALTER TABLE [dbo].[library_customdata] CHECK CONSTRAINT [FK_library_customdata_Contact_ContactID]
GO

ALTER TABLE [dbo].[library_customdata]  WITH CHECK ADD  CONSTRAINT [FK_library_customdata_relationshiptype_programid] FOREIGN KEY([program_id])
REFERENCES [dbo].[Rel_lkp_RelationshipType] ([RelationshipTypeId])
GO

ALTER TABLE [dbo].[library_customdata] CHECK CONSTRAINT [FK_library_customdata_relationshiptype_programid]
GO

ALTER TABLE [dbo].[library_customdata]  WITH CHECK ADD  CONSTRAINT [FK_library_customdata_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_customdata] CHECK CONSTRAINT [FK_library_customdata_user_accounts_cb]
GO

ALTER TABLE [dbo].[library_customdata]  WITH CHECK ADD  CONSTRAINT [FK_library_customdata_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_customdata] CHECK CONSTRAINT [FK_library_customdata_user_accounts_ub]
GO

ALTER TABLE [dbo].[library_customdata]  WITH CHECK ADD  CONSTRAINT [FK_library_customdata_user_accounts_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_customdata] CHECK CONSTRAINT [FK_library_customdata_user_accounts_user_id]
GO


CREATE TABLE [dbo].[library_systemdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[contactid] [int] NOT NULL,
	[connectionid] [int] NULL,
	[connid] [int] NULL,
	[data_xml] [xml] NULL,
	[created_by] [int]  NULL,
	[created_at] [datetime]  NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_systemdata_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[library_systemdata]  WITH CHECK ADD  CONSTRAINT [FK_library_systemdata_Contact_ContactID] FOREIGN KEY([contactid])
REFERENCES [dbo].[Contact] ([ContactId])
GO

ALTER TABLE [dbo].[library_systemdata] CHECK CONSTRAINT [FK_library_systemdata_Contact_ContactID]
GO

ALTER TABLE [dbo].[library_systemdata]  WITH CHECK ADD  CONSTRAINT [FK_library_systemdata_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_systemdata] CHECK CONSTRAINT [FK_library_systemdata_user_accounts_cb]
GO

ALTER TABLE [dbo].[library_systemdata]  WITH CHECK ADD  CONSTRAINT [FK_library_systemdata_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_systemdata] CHECK CONSTRAINT [FK_library_systemdata_user_accounts_ub]
GO

ALTER TABLE [dbo].[library_systemdata]  WITH CHECK ADD  CONSTRAINT [FK_library_systemdata_user_accounts_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_systemdata] CHECK CONSTRAINT [FK_library_systemdata_user_accounts_user_id]
GO


CREATE TABLE [dbo].[library_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_master_id] [int] NOT NULL,
	[tag] [varchar](255)  NULL,
	[created_by] [int]  NULL,
	[created_at] [datetime]  NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_tag_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[library_tag]  WITH CHECK ADD  CONSTRAINT [FK_library_tag_library_master_id] FOREIGN KEY([library_master_id])
REFERENCES [dbo].[library_master] ([id])
GO

ALTER TABLE [dbo].[library_tag] CHECK CONSTRAINT [FK_library_tag_library_master_id]
GO

ALTER TABLE [dbo].[library_tag]  WITH CHECK ADD  CONSTRAINT [FK_library_tag_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_tag] CHECK CONSTRAINT [FK_library_tag_user_accounts_cb]
GO

ALTER TABLE [dbo].[library_tag]  WITH CHECK ADD  CONSTRAINT [FK_library_tag_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO

ALTER TABLE [dbo].[library_tag] CHECK CONSTRAINT [FK_library_tag_user_accounts_ub]
GO




