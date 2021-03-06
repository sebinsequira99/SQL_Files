
/****** Object:  Table [dbo].[form_datas]    Script Date: 8/21/2015 11:23:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[form_datas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[connid] [int] NOT NULL,
	[connectionid] [int] NOT NULL,
	[data_json] [varchar](max) NOT NULL,
	[data_xml] [xml] NOT NULL,
	[created_by] [int] NOT NULL,
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
/****** Object:  Table [dbo].[forms]    Script Date: 8/21/2015 11:23:29 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_name] [nvarchar](255) NOT NULL,
	[definition_json] [text] NOT NULL,
	[is_subform] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[library_customdata]    Script Date: 8/21/2015 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[library_customdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[scope] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[contactid] [int] NOT NULL,
	[connectionid] [int] NULL,
	[connid] [int] NULL,
	[program_id] [int] NULL,
	[data_xml] [xml] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_customdata_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[library_master]    Script Date: 8/21/2015 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[library_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_name] [varchar](200) NOT NULL,
	[library_desc] [varchar](255) NOT NULL,
	[isSystem] [bit] NOT NULL,
	[scope] [int] NOT NULL,
	[program_id] [int] NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[controltype] [char](1) NOT NULL,
	[datatype] [varchar](20) NOT NULL,
	[fieldsize] [int] NULL,
	[data_json] [nvarchar](max) NULL,
 CONSTRAINT [PK_library_master_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[library_systemdata]    Script Date: 8/21/2015 11:23:29 AM ******/
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
	[data_xml] [xml] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_library_systemdata_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[library_tag]    Script Date: 8/21/2015 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[library_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[library_master_id] [int] NOT NULL,
	[tag] [varchar](255) NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
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
SET IDENTITY_INSERT [dbo].[forms] ON 

INSERT [dbo].[forms] ([id], [form_name], [definition_json], [is_subform]) VALUES (1, N'Main Form Test', N'{"form_settings":{"send_auto_respond":true,"form_label":"Main Form Test","type":"N","form_name":"form_1438675153006"},"form_json":{"pages":[{"page_name":"page_1438675153006","page_label":"Page 1","fields":[{"type":"subform","subform_id":"2","name":"subform_1438678132818","repeat":2,"columnsize":12,"items":[{"type":"text","label":"First Name","name":"text_1438675185942","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false},{"type":"text","label":"Last Name","name":"text_1438675195952","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false}],"active":true,"label":"Address 1","is_multi":true}],"active":true}]},"form_rules":[]}', 0)
INSERT [dbo].[forms] ([id], [form_name], [definition_json], [is_subform]) VALUES (2, N'Subform', N'{"form_settings":{"form_label":"Subform","description":"subform","form_name":"form_1438675181360"},"form_json":{"pages":[{"page_name":"page_1438675181360","page_label":"Page 1","fields":[{"type":"text","label":"First Name","name":"text_1438675185942","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false},{"type":"text","label":"Last Name","name":"text_1438682890320","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":true}],"active":true}]},"form_rules":[]}', 1)
INSERT [dbo].[forms] ([id], [form_name], [definition_json], [is_subform]) VALUES (3, N'Biodata form', N'{"form_settings":{"form_label":"Biodata form","type":"N","form_name":"form_1438682964946"},"form_json":{"pages":[{"page_name":"page_1438682964946","page_label":"Page 1","fields":[{"type":"text","label":"Age","name":"text_1438682976752","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false},{"type":"email","label":"Email","name":"email_1438682985499","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false},{"type":"radio","label":"Gender","name":"radio_1438682993923","default":"","inline":"false","columnsize":12,"items":[{"label":"Female","value":"f"},{"label":"Male","value":"m"}],"active":false},{"type":"subform","subform_id":"2","name":"subform_1438683032153","repeat":2,"columnsize":12,"items":[{"type":"text","label":"First Name","name":"text_1438675185942","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false},{"type":"text","label":"Last Name","name":"text_1438682890320","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":false}],"active":true,"label":"Fullname subform","is_multi":true}],"active":true}]},"form_rules":[]}', 0)
INSERT [dbo].[forms] ([id], [form_name], [definition_json], [is_subform]) VALUES (4, N'test sub form', N'{"form_settings":{"form_label":"test sub form","description":"test sub form","form_name":"form_1439998797253"},"form_json":{"pages":[{"page_name":"page_1439998797253","page_label":"Page 1","fields":[{"type":"text","label":"name","name":"text_1439998805556","placeholder":"","default":"","validate":{"require":"false","minlenght":"undefined","maxlenght":"undefined"},"columnsize":12,"active":true}],"active":true}]},"form_rules":[]}', 1)
SET IDENTITY_INSERT [dbo].[forms] OFF
SET IDENTITY_INSERT [dbo].[library_master] ON 

INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4189, N'AuthorizationFormReceived_524', N'Adoptee - Authorization Form Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AuthorizationFormReceived_524'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4190, N'DateReceived_525', N'Adoptee - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_525'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4191, N'Notifybeforereleasingidentity_527', N'Adoptee - Notify before releasing identity', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Notifybeforereleasingidentity_527'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4192, N'PermissionNOTgiventoreleaseidentifying_528', N'Adoptee - Permission NOT given to release identifying ', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''PermissionNOTgiventoreleaseidentifying_528'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4193, N'Permissionreceivedtoreleaseidentifyinginfo_526', N'Adoptee - Permission received to release identifying info', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Permissionreceivedtoreleaseidentifyinginfo_526'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4194, N'AuthorizationFormReceived_529', N'BirthParent - Authorization Form Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AuthorizationFormReceived_529'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4195, N'DateReceived_530', N'BirthParent - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_530'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4196, N'Notifybeforereleasingidentity_532', N'BirthParent - Notify before releasing identity', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Notifybeforereleasingidentity_532'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4197, N'PermissionNOTgiventoreleaseidentifying_533', N'BirthParent - Permission NOT given to release identifying', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''PermissionNOTgiventoreleaseidentifying_533'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4198, N'Permissionreceivedtoreleaseidentifyinginfo_531', N'BirthParent - Permission receivedto release identifying info', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Permissionreceivedtoreleaseidentifyinginfo_531'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4199, N'agencysignature', N'Agency signature field', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''agencysignature'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4200, N'ap1signature', N'Client 1 signature field', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''ap1signature'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4201, N'ap2signature', N'Client 2 signature field', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''ap2signature'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4202, N'cwsignature', N'Caseworker signature field', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''cwsignature'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4203, N'AP1ActAge', N'Parent 1 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4204, N'AP1Age', N'Parent 1 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4205, N'AP2ActAge', N'Parent 2 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4206, N'AP2Age', N'Parent 2 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4207, N'CurrentDate', N'Current Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''CurrentDate'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4208, N'FamilyName', N'Family Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''FamilyName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4209, N'HusbandDOB', N'Husband DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''HusbandDOB'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4210, N'HusbandFirstName', N'Husband First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''HusbandFirstName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4211, N'HusbandFullName', N'Husband Full Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''HusbandFullName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4212, N'HusbandLastName', N'Husband Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''HusbandLastName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4213, N'HusbandSSN', N'Husband SSN', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''HusbandSSN'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4214, N'LastNameFamilyName', N'Family Name Last Name First', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''LastNameFamilyName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4215, N'Rel10ActAge', N'Rel 10 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4216, N'Rel10Age', N'Rel 10 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4217, N'Rel1ActAge', N'Rel 1 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4218, N'Rel1Age', N'Rel 1 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4219, N'Rel2ActAge', N'Rel 2 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4220, N'Rel2Age', N'Rel 2 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4221, N'Rel3ActAge', N'Rel 3 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4222, N'Rel3Age', N'Rel 3 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4223, N'Rel4ActAge', N'Rel 4 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4224, N'Rel4Age', N'Rel 4 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4225, N'Rel5ActAge', N'Rel 5 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4226, N'Rel5Age', N'Rel 5 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4227, N'Rel6ActAge', N'Rel 6 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4228, N'Rel6Age', N'Rel 6 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4229, N'Rel7ActAge', N'Rel 7 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4230, N'Rel7Age', N'Rel 7 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4231, N'Rel8ActAge', N'Rel 8 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4232, N'Rel8Age', N'Rel 8 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4233, N'Rel9ActAge', N'Rel 9 Actual Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9ActAge'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4234, N'Rel9Age', N'Rel 9 Age', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Age'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4235, N'WifeDOB', N'Wife DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''WifeDOB'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4236, N'WifeFirstName', N'Wife First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''WifeFirstName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4237, N'WifeFullName', N'Wife Full Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''WifeFullName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4238, N'WifeLastName', N'Wife Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''WifeLastName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4239, N'WifeSSN', N'Wife SSN', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''WifeSSN'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4240, N'AgencyServicesProvidedFor_522', N'Initiator - Agency Services Provided For', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AgencyServicesProvidedFor_522'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4241, N'CourseofContact_523', N'Initiator - Course of Contact', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 2000, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''CourseofContact_523'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 2000
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4242, N'InitiatedBy_521', N'Initiator - Initiated By', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''InitiatedBy_521'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4243, N'BirthFather1__158', N'MAPAdoptionSystem - Birth Father 1', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''BirthFather1__158'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4244, N'BirthFather2__159', N'MAPAdoptionSystem - Birth Father 2', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''BirthFather2__159'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4245, N'BirthFather3__160', N'MAPAdoptionSystem - Birth Father 3', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''BirthFather3__160'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4246, N'ChildReferral1__150', N'MAPAdoptionSystem - Child Referral 1', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''ChildReferral1__150'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4247, N'ChildReferral2__151', N'MAPAdoptionSystem - Child Referral 2', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''ChildReferral2__151'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4248, N'ChildReferral3__152', N'MAPAdoptionSystem - Child Referral 3', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''ChildReferral3__152'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4249, N'DossierCompletion__153', N'MAPAdoptionSystem - Dossier Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DossierCompletion__153'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4250, N'DossierSent__154', N'MAPAdoptionSystem - Dossier Sent', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DossierSent__154'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4251, N'ExpectedDueDate__148', N'MAPAdoptionSystem - Expected Due Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''ExpectedDueDate__148'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4252, N'FinalizationDate__113', N'MAPAdoptionSystem - Finalization Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''FinalizationDate__113'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4253, N'HomeStudyCompleteDate__103', N'MAPAdoptionSystem - Home Study Complete Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''HomeStudyCompleteDate__103'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4254, N'HomeStudyRenewalDate__104', N'MAPAdoptionSystem - Home Study Renewal Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''HomeStudyRenewalDate__104'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4255, N'P1ChildAbuseCompletion__129', N'MAPAdoptionSystem - P1 Child Abuse Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1ChildAbuseCompletion__129'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4256, N'P1ChildAbuseRenewal__131', N'MAPAdoptionSystem - P1 Child Abuse Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1ChildAbuseRenewal__131'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4257, N'P1CPRFirstAidCompletion__143', N'MAPAdoptionSystem - P1 CPR  First Aid - Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1CPRFirstAidCompletion__143'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4258, N'P1CPRFirstAidRenewal__145', N'MAPAdoptionSystem - P1 CPR  First Aid - Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1CPRFirstAidRenewal__145'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4259, N'P1CriminalBackgroundCheckCompletion__125', N'MAPAdoptionSystem - P1 Criminal Background Check Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1CriminalBackgroundCheckCompletion__125'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4260, N'P1CriminalBackgroundCheckRenewal__127', N'MAPAdoptionSystem - P1 Criminal Background Check Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1CriminalBackgroundCheckRenewal__127'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4261, N'P1DriverLicense__137', N'MAPAdoptionSystem - P1 Driver License', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1DriverLicense__137'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4262, N'P1FDLEFBIClearanceCompletion__121', N'MAPAdoptionSystem - P1 FDLEFBI Clearance Completion ', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1FDLEFBIClearanceCompletion__121'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4263, N'P1FDLEFBIClearanceRenewal__123', N'MAPAdoptionSystem - P1 FDLEFBI Clearance Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1FDLEFBIClearanceRenewal__123'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4264, N'P1MedicalClearancesCompletion__133', N'MAPAdoptionSystem - P1 Medical Clearances - Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1MedicalClearancesCompletion__133'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4265, N'P1MedicalClearancesRenewal__135', N'MAPAdoptionSystem - P1 Medical Clearances - Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P1MedicalClearancesRenewal__135'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4266, N'P2ChildAbuseCompletion__130', N'MAPAdoptionSystem - P2 Child Abuse Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2ChildAbuseCompletion__130'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4267, N'P2ChildAbuseRenewal__132', N'MAPAdoptionSystem - P2 Child Abuse Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2ChildAbuseRenewal__132'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4268, N'P2CPRFirstAidCompletion__144', N'MAPAdoptionSystem - P2 CPR  First Aid - Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2CPRFirstAidCompletion__144'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4269, N'P2CPRFirstAidRenewal__146', N'MAPAdoptionSystem - P2 CPR  First Aid - Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2CPRFirstAidRenewal__146'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4270, N'P2CriminalBackgroundCheckCompletion__126', N'MAPAdoptionSystem - P2 Criminal Background Check Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2CriminalBackgroundCheckCompletion__126'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4271, N'P2CriminalBackgroundCheckRenewal__128', N'MAPAdoptionSystem - P2 Criminal Background Check Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2CriminalBackgroundCheckRenewal__128'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4272, N'P2DriverLicense__138', N'MAPAdoptionSystem - P2 Driver License', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2DriverLicense__138'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4273, N'P2FDLEFBIClearanceCompletion__122', N'MAPAdoptionSystem - P2 FDLEFBI Clearance Completion ', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2FDLEFBIClearanceCompletion__122'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4274, N'P2FDLEFBIClearanceRenewal__124', N'MAPAdoptionSystem - P2 FDLEFBI Clearance Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2FDLEFBIClearanceRenewal__124'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4275, N'P2MedicalClearancesCompletion__134', N'MAPAdoptionSystem - P2 Medical Clearances - Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2MedicalClearancesCompletion__134'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4276, N'P2MedicalClearancesRenewal__136', N'MAPAdoptionSystem - P2 Medical Clearances - Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''P2MedicalClearancesRenewal__136'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4277, N'PetImmunizationCompletion__156', N'MAPAdoptionSystem - Pet Immunization Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''PetImmunizationCompletion__156'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4278, N'PetImmunizationRenewal__157', N'MAPAdoptionSystem - Pet Immunization Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''PetImmunizationRenewal__157'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4279, N'PhysicalPlacement__147', N'MAPAdoptionSystem - Physical Placement', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''PhysicalPlacement__147'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4280, N'progint_560', N'MAPAdoptionSystem - progint', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''progint_560'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4281, N'ReferenceCompletionDate__155', N'MAPAdoptionSystem - Reference Completion Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''ReferenceCompletionDate__155'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4282, N'SiteInspectionCompletion__141', N'MAPAdoptionSystem - Site Inspection - Completion', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''SiteInspectionCompletion__141'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4283, N'SiteInspectionRenewal__142', N'MAPAdoptionSystem - Site Inspection - Renewal', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''SiteInspectionRenewal__142'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4284, N'Add1', N'Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4285, N'Add2', N'Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4286, N'AgencyCaseId', N'Agency CaseId', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AgencyCaseId'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4287, N'AP1BirthCity', N'Parent 1 Birth City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1BirthCity'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
GO
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4288, N'AP1BirthCountry', N'Parent 1 Birth Country', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1BirthCountry'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4289, N'AP1BirthName', N'Parent 1 Birth Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1BirthName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4290, N'AP1BirthState', N'Parent 1 Birth State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1BirthState'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4291, N'AP1CellPhone', N'Parent 1 Cell Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1CellPhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4292, N'AP1Degree', N'Parent 1 Degree', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Degree'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4293, N'AP1DegreeYear', N'Parent 1 Degree Year', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1DegreeYear'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4294, N'AP1DOB', N'Parent 1 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''AP1DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4295, N'AP1Email', N'Parent 1 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 200, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Email'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 200
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4296, N'AP1Ethnicity', N'Parent 1 Ethnicity', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Ethnicity'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4297, N'AP1Fname', N'Parent 1 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4298, N'AP1Gender', N'Parent 1 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4299, N'AP1Institution', N'Parent 1 School', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Institution'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4300, N'AP1Language', N'Parent 1 Language', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Language'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4301, N'AP1Language2', N'Parent 1 Language 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Language2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4302, N'AP1Lname', N'Parent 1 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4303, N'AP1MarraigeDate', N'Parent 1 1st Marriage Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP1MarraigeDate'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4304, N'AP1MarraigeDate2', N'Parent 1 2nd Marriage Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP1MarraigeDate2'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4305, N'AP1MarriageStatus', N'Parent 1 Marriage Status', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1MarriageStatus'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4306, N'AP1MarriageStatus2', N'Parent 1 2nd Marriage Status', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1MarriageStatus2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4307, N'AP1MName', N'Parent 1 Middle Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1MName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4308, N'AP1Nickname', N'Parent 1 Nickname', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Nickname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4309, N'AP1Race', N'Parent 1 Race', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Race'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4310, N'AP1Race2', N'Parent 1 2nd Race', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Race2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4311, N'AP1Race3', N'Parent 1 3rd Race', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Race3'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4312, N'AP1Religion', N'Parent 1 Religion', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Religion'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4313, N'AP1Salutation', N'Parent 1 Salutation', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 20, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Salutation'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 20
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4314, N'AP1Spouse', N'Parent 1 Spouse', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Spouse'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4315, N'AP1Spouse2', N'Parent 1 2nd Spouse', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1Spouse2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4316, N'AP1SSN', N'Parent 1 SSN', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1SSN'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4317, N'AP1TerminationDate', N'Parent 1 1st Termination Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP1TerminationDate'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4318, N'AP1TerminationDate2', N'Parent 1 2nd Termination Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP1TerminationDate2'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4319, N'AP1TermReason', N'Parent 1 1st Termination Reason', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1TermReason'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4320, N'AP1TermReason2', N'Parent 1 2nd Termination Reason', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1TermReason2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4321, N'AP1WorkPhone', N'Parent 1 Work Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP1WorkPhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4322, N'AP2BirthCity', N'Parent 2 Birth City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2BirthCity'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4323, N'AP2BirthCountry', N'Parent 2 Birth Country', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2BirthCountry'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4324, N'AP2BirthName', N'Parent 2 Birth Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2BirthName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4325, N'AP2BirthState', N'Parent 2 Birth State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2BirthState'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4326, N'AP2CellPhone', N'Parent 2 Cell Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2CellPhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4327, N'AP2Degree', N'Parent 2 Degree', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Degree'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4328, N'AP2DegreeYear', N'Parent 2 Degree Year', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2DegreeYear'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4329, N'AP2DOB', N'Parent 2 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''AP2DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4330, N'AP2Email', N'Parent 2 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 200, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Email'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 200
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4331, N'AP2Ethnicity', N'Parent 2 Ethnicity', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Ethnicity'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4332, N'AP2Fname', N'Parent 2 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4333, N'AP2Gender', N'Parent 2 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4334, N'AP2Institution', N'Parent 2 School', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Institution'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4335, N'AP2Language', N'Parent 2 Language ', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Language'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4336, N'AP2Language2', N'Parent 2 Language 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Language2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4337, N'AP2Lname', N'Parent 2 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4338, N'AP2MarraigeDate', N'Parent 2 1st Marriage Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP2MarraigeDate'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4339, N'AP2MarraigeDate2', N'Parent 2 2nd Marriage Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP2MarraigeDate2'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4340, N'AP2MarriageStatus', N'Parent 2 Marriage Status', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2MarriageStatus'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4341, N'AP2MarriageStatus2', N'Parent 2 2nd Marriage Status', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2MarriageStatus2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4342, N'AP2MName', N'Parent 2 Middle Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2MName'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4343, N'AP2Nickname', N'Parent 2 Nickname', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Nickname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4344, N'AP2Race', N'Parent 2 Race', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Race'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4345, N'AP2Race2', N'Parent 2 2nd Race', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Race2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4346, N'AP2Race3', N'Parent 3 3rd Race', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Race3'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4347, N'AP2Religion', N'Parent 2 Religion', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Religion'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4348, N'AP2Salutation', N'Parent 2 Salutation', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 20, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Salutation'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 20
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4349, N'AP2Spouse', N'Parent 2 Spouse', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Spouse'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4350, N'AP2Spouse2', N'Parent 2 2nd Spouse', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2Spouse2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4351, N'AP2SSN', N'Parent 2 SSN', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2SSN'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4352, N'AP2TerminationDate', N'Parent 2 1st Termination Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP2TerminationDate'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4353, N'AP2TerminationDate2', N'Parent 2 2nd Termination Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''AP2TerminationDate2'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4354, N'AP2TermReason', N'Parent 2 1st Termination Reason', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2TermReason'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4355, N'AP2TermReason2', N'Parent 2 2nd Termination Reason', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 30, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2TermReason2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 30
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4356, N'AP2WorkPhone', N'Parent 2 Work Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AP2WorkPhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4357, N'CaseWorkerFname', N'Caseworker First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''CaseWorkerFname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4358, N'CaseWorkerLname', N'Caseworker Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''CaseWorkerLname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4359, N'City', N'City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4360, N'Country', N'Country', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Country'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4361, N'County', N'County', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''County'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4362, N'EDD', N'Expectant Date', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''EDD'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4363, N'Emp1Add1', N'Parent 1 Employer Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4364, N'Emp1Add2', N'Parent 1 Employer Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4365, N'Emp1City', N'Parent 1 Employer City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4366, N'Emp1Fname', N'Parent 1 Employer First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4367, N'Emp1Lname', N'Parent 1 Employer Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4368, N'Emp1Relationship', N'Parent 1 Employer Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4369, N'Emp1Salary', N'Employer1 Salary', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Salary'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4370, N'Emp1State', N'Parent 1 Employer State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4371, N'Emp1Zip', N'Parent 1 Employer Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp1Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4372, N'Emp2Add1', N'Parent 2  Employer Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4373, N'Emp2Add2', N'Parent 2  Employer Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4374, N'Emp2City', N'Parent 2 Employer City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4375, N'Emp2Fname', N'Parent 2 Employer First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4376, N'Emp2Lname', N'Parent 2  Employer Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4377, N'Emp2Relationship', N'Parent 2  Employer Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4378, N'Emp2Salary', N'Employer2 Salary', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Salary'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4379, N'Emp2State', N'Parent 2 Employer State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4380, N'Emp2Zip', N'Parent 2 Employer Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Emp2Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4381, N'HomePhone', N'Home Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4382, N'Program', N'Program', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Program'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4383, N'Ref10Add1', N'Ref 10 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4384, N'Ref10Add2', N'Ref 10 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4385, N'Ref10City', N'Ref 10 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4386, N'Ref10EMail', N'Ref 10 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4387, N'Ref10Fname', N'Ref 10 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
GO
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4388, N'Ref10Lname', N'Ref 10 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4389, N'Ref10Relationship', N'Ref 10 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4390, N'Ref10State', N'Ref 10 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4391, N'Ref10Zip', N'Ref 10 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref10Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4392, N'Ref1Add1', N'Ref 1 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4393, N'Ref1Add2', N'Ref 1 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4394, N'Ref1City', N'Ref 1 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4395, N'Ref1EMail', N'Ref 1 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4396, N'Ref1Fname', N'Ref 1 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4397, N'Ref1Lname', N'Ref 1 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4398, N'Ref1Relationship', N'Ref 1 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4399, N'Ref1State', N'Ref 1 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4400, N'Ref1Zip', N'Ref 1 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref1Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4401, N'Ref2Add1', N'Ref 2 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4402, N'Ref2Add2', N'Ref 2 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4403, N'Ref2City', N'Ref 2 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4404, N'Ref2EMail', N'Ref 2 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4405, N'Ref2Fname', N'Ref 2 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4406, N'Ref2Lname', N'Ref 2 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4407, N'Ref2Relationship', N'Ref 2 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4408, N'Ref2State', N'Ref 2 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4409, N'Ref2Zip', N'Ref 2 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref2Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4410, N'Ref3Add1', N'Ref 3 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4411, N'Ref3Add2', N'Ref 3 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4412, N'Ref3City', N'Ref 3 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4413, N'Ref3EMail', N'Ref 3 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4414, N'Ref3Fname', N'Ref 3 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4415, N'Ref3Lname', N'Ref 3 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4416, N'Ref3Relationship', N'Ref 3 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4417, N'Ref3State', N'Ref 3 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4418, N'Ref3Zip', N'Ref 3 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref3Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4419, N'Ref4Add1', N'Ref 4 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4420, N'Ref4Add2', N'Ref 4 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4421, N'Ref4City', N'Ref 4 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4422, N'Ref4EMail', N'Ref 4 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4423, N'Ref4Fname', N'Ref 4 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4424, N'Ref4Lname', N'Ref 4 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4425, N'Ref4Relationship', N'Ref 4 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4426, N'Ref4State', N'Ref 4 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4427, N'Ref4Zip', N'Ref 4 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref4Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4428, N'Ref5Add1', N'Ref 5 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4429, N'Ref5Add2', N'Ref 5 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4430, N'Ref5City', N'Ref 5 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4431, N'Ref5EMail', N'Ref 5 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4432, N'Ref5Fname', N'Ref 5 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4433, N'Ref5Lname', N'Ref 5 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4434, N'Ref5Relationship', N'Ref 5 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4435, N'Ref5State', N'Ref 5 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4436, N'Ref5Zip', N'Ref 5 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref5Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4437, N'Ref6Add1', N'Ref 6 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4438, N'Ref6Add2', N'Ref 6 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4439, N'Ref6City', N'Ref 6 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4440, N'Ref6EMail', N'Ref 6 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4441, N'Ref6Fname', N'Ref 6 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4442, N'Ref6Lname', N'Ref 6 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4443, N'Ref6Relationship', N'Ref 6 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4444, N'Ref6State', N'Ref 6 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4445, N'Ref6Zip', N'Ref 6 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref6Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4446, N'Ref7Add1', N'Ref 7 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4447, N'Ref7Add2', N'Ref 7 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4448, N'Ref7City', N'Ref 7 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4449, N'Ref7EMail', N'Ref 7 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4450, N'Ref7Fname', N'Ref 7 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4451, N'Ref7Lname', N'Ref 7 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4452, N'Ref7Relationship', N'Ref 7 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4453, N'Ref7State', N'Ref 7 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4454, N'Ref7Zip', N'Ref 7 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref7Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4455, N'Ref8Add1', N'Ref 8 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4456, N'Ref8Add2', N'Ref 8 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4457, N'Ref8City', N'Ref 8 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4458, N'Ref8EMail', N'Ref 8 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4459, N'Ref8Fname', N'Ref 8 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4460, N'Ref8Lname', N'Ref 8 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4461, N'Ref8Relationship', N'Ref 8 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4462, N'Ref8State', N'Ref 8 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4463, N'Ref8Zip', N'Ref 8 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref8Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4464, N'Ref9Add1', N'Ref 9 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4465, N'Ref9Add2', N'Ref 9 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4466, N'Ref9City', N'Ref 9 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4467, N'Ref9EMail', N'Ref 9 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4468, N'Ref9Fname', N'Ref 9 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4469, N'Ref9Lname', N'Ref 9 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4470, N'Ref9Relationship', N'Ref 9 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4471, N'Ref9State', N'Ref 9 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4472, N'Ref9Zip', N'Ref 9 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Ref9Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4473, N'ReferralSource', N'Referral Source', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', 500, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''ReferralSource'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4474, N'Rel10Add1', N'Rel 10 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4475, N'Rel10Add2', N'Rel 10 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4476, N'Rel10City', N'Rel 10 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4477, N'Rel10DOB', N'Rel 10 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel10DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4478, N'Rel10EMail', N'Rel 10 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4479, N'Rel10Fname', N'Rel 10 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4480, N'Rel10Gender', N'Rel 10 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4481, N'Rel10HomePhone', N'Rel 10 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4482, N'Rel10Lname', N'Rel 10 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4483, N'Rel10Relationship', N'Rel 10 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4484, N'Rel10State', N'Rel 10 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4485, N'Rel10Zip', N'Rel 10 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel10Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4486, N'Rel1Add1', N'Group Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4487, N'Rel1Add1', N'Rel 1 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
GO
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4488, N'Rel1Add2', N'Group Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4489, N'Rel1Add2', N'Rel 1 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4490, N'Rel1CellPhone', N'Group Cell Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1CellPhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4491, N'Rel1City', N'Group City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4492, N'Rel1City', N'Rel 1 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4493, N'Rel1Country', N'Group Country', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 75, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Country'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 75
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4494, N'Rel1County', N'Group County', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1County'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4495, N'Rel1DOB', N'Group DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1DOB'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4496, N'Rel1DOB', N'Rel 1 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel1DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4497, N'Rel1EMail', N'Group Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4498, N'Rel1EMail', N'Rel 1 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4499, N'Rel1Ethnicity1', N'Group Ethnicity 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Ethnicity1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4500, N'Rel1Ethnicity2', N'Group Ethnicity 2 ', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Ethnicity2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4501, N'Rel1Fname', N'Group First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4502, N'Rel1Fname', N'Rel 1 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4503, N'Rel1Gender', N'Group Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4504, N'Rel1Gender', N'Rel 1 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4505, N'Rel1HomePhone', N'Group HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4506, N'Rel1HomePhone', N'Rel 1 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4507, N'Rel1Lname', N'Group Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4508, N'Rel1Lname', N'Rel 1 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4509, N'Rel1Race1', N'Group Race 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Race1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4510, N'Rel1Race2', N'Group Race 2 ', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 50, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Race2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 50
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4511, N'Rel1Relationship', N'Group Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4512, N'Rel1Relationship', N'Rel 1 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4513, N'rel1SSN', N'Group SSN', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''rel1SSN'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4514, N'Rel1State', N'Group State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4515, N'Rel1State', N'Rel 1 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4516, N'Rel1WorkPhone', N'Group Work Phone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1WorkPhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4517, N'Rel1Zip', N'Group Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4518, N'Rel1Zip', N'Rel 1 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel1Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4519, N'Rel2Add1', N'Rel 2 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4520, N'Rel2Add2', N'Rel 2 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4521, N'Rel2City', N'Rel 2 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4522, N'Rel2DOB', N'Rel 2 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel2DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4523, N'Rel2EMail', N'Rel 2 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4524, N'Rel2Fname', N'Rel 2 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4525, N'Rel2Gender', N'Rel 2 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4526, N'Rel2HomePhone', N'Rel 2 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4527, N'Rel2Lname', N'Rel 2 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4528, N'Rel2Relationship', N'Rel 2 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4529, N'Rel2State', N'Rel 2 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4530, N'Rel2Zip', N'Rel 2 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel2Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4531, N'Rel3Add1', N'Rel 3 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4532, N'Rel3Add2', N'Rel 3 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4533, N'Rel3City', N'Rel 3 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4534, N'Rel3DOB', N'Rel 3 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel3DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4535, N'Rel3EMail', N'Rel 3 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4536, N'Rel3Fname', N'Rel 3 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4537, N'Rel3Gender', N'Rel 3 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4538, N'Rel3HomePhone', N'Rel 3 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4539, N'Rel3Lname', N'Rel 3 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4540, N'Rel3Relationship', N'Rel 3 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4541, N'Rel3State', N'Rel 3 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4542, N'Rel3Zip', N'Rel 3 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel3Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4543, N'Rel4Add1', N'Rel 4 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4544, N'Rel4Add2', N'Rel 4 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4545, N'Rel4City', N'Rel 4 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4546, N'Rel4DOB', N'Rel 4 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel4DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4547, N'Rel4EMail', N'Rel 4 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4548, N'Rel4Fname', N'Rel 4 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4549, N'Rel4Gender', N'Rel 4 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4550, N'Rel4HomePhone', N'Rel 4 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4551, N'Rel4Lname', N'Rel 4 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4552, N'Rel4Relationship', N'Rel 4 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4553, N'Rel4State', N'Rel 4 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4554, N'Rel4Zip', N'Rel 4 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel4Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4555, N'Rel5Add1', N'Rel 5 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4556, N'Rel5Add2', N'Rel 5 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4557, N'Rel5City', N'Rel 5 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4558, N'Rel5DOB', N'Rel 5 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel5DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4559, N'Rel5EMail', N'Rel 5 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4560, N'Rel5Fname', N'Rel 5 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4561, N'Rel5Gender', N'Rel 5 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4562, N'Rel5HomePhone', N'Rel 5 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4563, N'Rel5Lname', N'Rel 5 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4564, N'Rel5Relationship', N'Rel 5 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4565, N'Rel5State', N'Rel 5 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4566, N'Rel5Zip', N'Rel 5 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel5Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4567, N'Rel6Add1', N'Rel 6 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4568, N'Rel6Add2', N'Rel 6 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4569, N'Rel6City', N'Rel 6 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4570, N'Rel6DOB', N'Rel 6 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel6DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4571, N'Rel6EMail', N'Rel 6 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4572, N'Rel6Fname', N'Rel 6 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4573, N'Rel6Gender', N'Rel 6 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4574, N'Rel6HomePhone', N'Rel 6 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4575, N'Rel6Lname', N'Rel 6 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4576, N'Rel6Relationship', N'Rel 6 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4577, N'Rel6State', N'Rel 6 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4578, N'Rel6Zip', N'Rel 6 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel6Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4579, N'Rel7Add1', N'Rel 7 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4580, N'Rel7Add2', N'Rel 7 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4581, N'Rel7City', N'Rel 7 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4582, N'Rel7DOB', N'Rel 7 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel7DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4583, N'Rel7EMail', N'Rel 7 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4584, N'Rel7Fname', N'Rel 7 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4585, N'Rel7Gender', N'Rel 7 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4586, N'Rel7HomePhone', N'Rel 7 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4587, N'Rel7Lname', N'Rel 7 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
GO
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4588, N'Rel7Relationship', N'Rel 7 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4589, N'Rel7State', N'Rel 7 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4590, N'Rel7Zip', N'Rel 7 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel7Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4591, N'Rel8Add1', N'Rel 8 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4592, N'Rel8Add2', N'Rel 8 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4593, N'Rel8City', N'Rel 8 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4594, N'Rel8DOB', N'Rel 8 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel8DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4595, N'Rel8EMail', N'Rel 8 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4596, N'Rel8Fname', N'Rel 8 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4597, N'Rel8Gender', N'Rel 8 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4598, N'Rel8HomePhone', N'Rel 8 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4599, N'Rel8Lname', N'Rel 8 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4600, N'Rel8Relationship', N'Rel 8 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4601, N'Rel8State', N'Rel 8 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4602, N'Rel8Zip', N'Rel 8 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel8Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4603, N'Rel9Add1', N'Rel 9 Address 1', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Add1'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4604, N'Rel9Add2', N'Rel 9 Address 2', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Add2'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4605, N'Rel9City', N'Rel 9 City', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9City'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4606, N'Rel9DOB', N'Rel 9 DOB', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', 26, N'date: { 
			 type: ''date'', 
			 name: ''Rel9DOB'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4607, N'Rel9EMail', N'Rel 9 Email', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 150, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9EMail'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 150
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4608, N'Rel9Fname', N'Rel 9 First Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Fname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4609, N'Rel9Gender', N'Rel 9 Gender', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Gender'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4610, N'Rel9HomePhone', N'Rel 9 HomePhone', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9HomePhone'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4611, N'Rel9Lname', N'Rel 9 Last Name', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Lname'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4612, N'Rel9Relationship', N'Rel 9 Relationship', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Relationship'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4613, N'Rel9State', N'Rel 9 State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4614, N'Rel9Zip', N'Rel 9 Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Rel9Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4615, N'State', N'State', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 10, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''State'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 10
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4616, N'SubProgram', N'Sub Program', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 100, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''SubProgram'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 100
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4617, N'Zip', N'Zip', 1, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 25, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Zip'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 25
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4618, N'Med_1EyeColor', N'Parent 1 Eye Color', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_1EyeColor'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4619, N'Med_1HairColor', N'Parent 1 Hair Color', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_1HairColor'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4620, N'Med_1Height', N'Parent 1 Height', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_1Height'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4621, N'Med_1IdentifyingMarks', N'Parent 1 Identifying Marks', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 2000, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_1IdentifyingMarks'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 2000
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4622, N'Med_1Sex', N'Parent 1 Sex', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_1Sex'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4623, N'Med_1Weight', N'Parent 1 Weight', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_1Weight'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4624, N'Med_2EyeColor', N'Parent 2 Eye Color', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_2EyeColor'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4625, N'Med_2HairColor', N'Parent 2 Hair Color', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_2HairColor'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4626, N'Med_2Height', N'Parent 2 Height', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_2Height'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4627, N'Med_2IdentifyingMarks', N'Parent 2 Identifying Marks', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 2000, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_2IdentifyingMarks'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 2000
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4628, N'Med_2Sex', N'Parent 2 Sex', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_2Sex'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4629, N'Med_2Weight', N'Parent 2 Weight', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 26, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Med_2Weight'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 26
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4630, N'AuthorizationFormReceived_534', N'Relative - Authorization Form Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AuthorizationFormReceived_534'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4631, N'Copyofbirthcertificatereceived_539', N'Relative - Copy of birth certificate received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Copyofbirthcertificatereceived_539'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4632, N'Copyofparentsdeathcertificatereceived_538', N'Relative - Copy of parents death certificate received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Copyofparentsdeathcertificatereceived_538'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4633, N'DateReceived_540', N'Relative - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_540'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4634, N'DateReceived_541', N'Relative - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_541'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4635, N'Notifybeforereleasingidentify_536', N'Relative - Notify before releasing identify', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Notifybeforereleasingidentify_536'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4636, N'PermissionNOTgiventoreleaseidentifying_537', N'Relative - Permission NOT given to release identifying', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''PermissionNOTgiventoreleaseidentifying_537'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4637, N'Permissionreceivedtoreleaseidentifyinginfo_535', N'Relative - Permission received to release identifying info', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Permissionreceivedtoreleaseidentifyinginfo_535'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4638, N'AuthorizationFormReceived_545', N'Sibling - Authorization Form Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''AuthorizationFormReceived_545'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4639, N'CopyofBirthCertificateReceived_547', N'Sibling - Copy of Birth Certificate Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''CopyofBirthCertificateReceived_547'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4640, N'Copyorparentsdeathcertificatereceived_546', N'Sibling - Copy or parents death certificate received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Copyorparentsdeathcertificatereceived_546'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4641, N'DateReceived_542', N'Sibling - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_542'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4642, N'DateReceived_543', N'Sibling - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_543'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4643, N'DateReceived_544', N'Sibling - Date Received', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''DateReceived_544'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4644, N'Notifybeforereleasingidentity_549', N'Sibling - Notify before releasing identity', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Notifybeforereleasingidentity_549'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4645, N'PermissionNOTreceivedtoreleaseidentifyinginfo_550', N'Sibling - Permission NOT received to release identifying info', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''PermissionNOTreceivedtoreleaseidentifyinginfo_550'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4646, N'Permissiontoreleaseidentifyinginformation_548', N'Sibling - Permission to release identifying information', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'B', N'', NULL, N'checkbox: { 
			 type: ''checkbox'', 
			 name: ''Permissiontoreleaseidentifyinginformation_548'', 
			 inline: ''false'', 
			 default: '''', 
			 columnsize: 12, 
			 items: [{ 
			 label: '''', 
			 value: '''' 
			 }] 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4647, N'EffectiveDate_409', N'System - Effective Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''EffectiveDate_409'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4648, N'ExpirationDate_410', N'System - Expiration Date', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'E', N'', NULL, N'date: { 
			 type: ''date'', 
			 name: ''ExpirationDate_410'', 
			 format: ''dd-MMMM-yyyy'', 
			 default: '''', 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4649, N'GroupNumber_408', N'System - Group Number', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''GroupNumber_408'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4650, N'MedicalCard_405', N'System - Medical Card', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''MedicalCard_405'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4651, N'PolicyNumber_407', N'System - Policy Number', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''PolicyNumber_407'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4652, N'Primary_406', N'System - Primary', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', NULL, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''Primary_406'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: ''''
			 }, 
			 columnsize: 12 
			 }')
INSERT [dbo].[library_master] ([id], [library_name], [library_desc], [isSystem], [scope], [program_id], [created_by], [created_at], [updated_by], [updated_at], [controltype], [datatype], [fieldsize], [data_json]) VALUES (4653, N'STMNumber_411', N'System - STM Number', 0, 1, NULL, 1, CAST(0x0000A4EC004FFDDA AS DateTime), NULL, NULL, N'T', N'', 255, N'text: { 
			 type: ''text'', 
			 label: '''', 
			 name: ''STMNumber_411'', 
			 placeholder: '''', 
			 default: '''', 
			 validate: { 
			 require: ''false'', 
			 minlength: 0, 
			 maxlength: 255
			 }, 
			 columnsize: 12 
			 }')
SET IDENTITY_INSERT [dbo].[library_master] OFF
ALTER TABLE [dbo].[forms] ADD  CONSTRAINT [DF_forms_is_subform]  DEFAULT ((0)) FOR [is_subform]
GO
ALTER TABLE [dbo].[form_datas]  WITH CHECK ADD  CONSTRAINT [FK_forms_data_user_accounts_cb] FOREIGN KEY([created_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[form_datas] CHECK CONSTRAINT [FK_forms_data_user_accounts_cb]
GO
ALTER TABLE [dbo].[form_datas]  WITH CHECK ADD  CONSTRAINT [FK_forms_data_user_accounts_ub] FOREIGN KEY([updated_by])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[form_datas] CHECK CONSTRAINT [FK_forms_data_user_accounts_ub]
GO
ALTER TABLE [dbo].[form_datas]  WITH CHECK ADD  CONSTRAINT [FK_forms_data_user_accounts_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[form_datas] CHECK CONSTRAINT [FK_forms_data_user_accounts_user_id]
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
