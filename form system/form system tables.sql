USE [MAPForm]
GO
/****** Object:  Table [dbo].[library_customdata]    Script Date: 10/5/2015 3:11:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[library_customdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[contactid] [int] NOT NULL,
	[connectionid] [int] NULL,
	[connid] [int] NULL,
	[scope] [int] NULL,
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
/****** Object:  Table [dbo].[library_data]    Script Date: 10/5/2015 3:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[library_data](
	[data_id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[reference_id] [int] NOT NULL,
	[scope] [int] NOT NULL,
	[data_XML] [xml] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[lastmodified_by] [int] NULL,
	[lastmodified_date] [datetime] NULL,
 CONSTRAINT [PK_library_data] PRIMARY KEY CLUSTERED 
(
	[data_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[library_group]    Script Date: 10/5/2015 3:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[library_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_groupname] [varchar](100) NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_group_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[library_group_fields]    Script Date: 10/5/2015 3:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[library_group_fields](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_master_id] [int] NOT NULL,
	[library_field_label] [varchar](200) NOT NULL,
	[seq] [int] NOT NULL,
 CONSTRAINT [PK_library_group_fields_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[library_master]    Script Date: 10/5/2015 3:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[library_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_name] [varchar](200) NOT NULL,
	[library_desc] [varchar](255) NULL,
	[isSystem] [bit] NULL,
	[scope] [int] NULL,
	[program_id] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[controltype] [char](1) NULL,
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
/****** Object:  Table [dbo].[library_systemdata]    Script Date: 10/5/2015 3:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[library_systemdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[contactid] [int] NOT NULL,
	[connectionid] [int] NULL,
	[connid] [int] NULL,
	[data_xml] [xml] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_systemdata_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[library_tag]    Script Date: 10/5/2015 3:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[library_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_master_id] [int] NOT NULL,
	[tag] [varchar](255) NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
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
ALTER TABLE [dbo].[library_group]  WITH CHECK ADD  CONSTRAINT [FK_library_group_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[library_group] CHECK CONSTRAINT [FK_library_group_user_accounts_ub]
GO
ALTER TABLE [dbo].[library_group]  WITH CHECK ADD  CONSTRAINT [FK_llibrary_group_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[library_group] CHECK CONSTRAINT [FK_llibrary_group_user_accounts_cb]
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
