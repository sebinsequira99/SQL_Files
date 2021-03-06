/****** Object:  Table [dbo].[lkpSecureCaseNoteTypes]    Script Date: 04-06-2015 12:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lkpSecureCaseNoteTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[noteType] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[Modifieddate] [datetime] NULL,
 CONSTRAINT [PK_lkpSecureCaseNoteTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[lkpSecureCaseNoteTypes] ON 

INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (6, N'90791', N'Child and Family Evaluation', 257, CAST(0x0000A46C00A5AB83 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (7, N'90832', N'Individual Counseling-Adult', 257, CAST(0x0000A46C00A5E670 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (8, N'90832', N'Individual Counseling-Child', 257, CAST(0x0000A46C00A60204 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (9, N'90791', N'Adult Evaluation', 257, CAST(0x0000A46C00A61C3E AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (10, N'90834', N'Individual Counseling-Adult', 257, CAST(0x0000A46C00A635D7 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (11, N'90834', N'Child + Adult Individual Counseling-Adult', 257, CAST(0x0000A46C00A65C90 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (12, N'90846', N'Family Counseling w/o Patient', 257, CAST(0x0000A46C00A677A2 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (13, N'90846', N'Child + Family Counseling w/o Patient', 257, CAST(0x0000A46C00A69D89 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (14, N'90847', N'Family Counseling w/ Patient', 257, CAST(0x0000A46C00A6C7D1 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (15, N'90847', N'C + Family Counseling w/Patient', 257, CAST(0x0000A46C00A6EC19 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (16, N'90847-52', N'C + Family Counseling w/ Patient-Abbreviated', 257, CAST(0x0000A46C00A70F3B AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (17, N'90853', N'Group Counseling', 257, CAST(0x0000A46C00A728F9 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteTypes] ([TypeID], [Code], [noteType], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (18, N'90853', N'Child and Family Group Counseling', 257, CAST(0x0000A46C00A741CB AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[lkpSecureCaseNoteTypes] OFF
ALTER TABLE [dbo].[lkpSecureCaseNoteTypes]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[lkpSecureCaseNoteTypes]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[lkpSecureCaseNoteTypes]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[lkpSecureCaseNoteTypes]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
