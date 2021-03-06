
/****** Object:  Table [dbo].[lkpSecureCaseNoteSubTypes]    Script Date: 09-06-2015 11:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF exists (select 1 from sys.objects where name='lkpSecureCaseNoteSubTypes' and type='u')
DROP TABLE lkpSecureCaseNoteSubTypes;

CREATE TABLE [dbo].[lkpSecureCaseNoteSubTypes](
	[SubTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[Modifieddate] [datetime] NULL,
 CONSTRAINT [PK_lkpSecureCaseNoteSubTypes_subtypeid] PRIMARY KEY CLUSTERED 
(
	[SubTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[lkpSecureCaseNoteSubTypes] ON 

INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (2, N'Phone call collateral', 338, CAST(0x0000A46C00AC943A AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (3, N'Phone call client', 338, CAST(0x0000A46C00ACABCD AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (4, N'E-mail', 338, CAST(0x0000A46C00ACB795 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (5, N'Team meeting', 338, CAST(0x0000A46C00ACC5A7 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (6, N'School meeting', 338, CAST(0x0000A46C00ACD1C9 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (7, N'Report writing', 338, CAST(0x0000A46C00ACDDF0 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (8, N'Report research', 338, CAST(0x0000A46C00ACED46 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (9, N'Treatment planning research', 338, CAST(0x0000A46C00ACFD81 AS DateTime), NULL, NULL)
INSERT [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [Modifieddate]) VALUES (10, N'Assessments', 338, CAST(0x0000A46C00AD070A AS DateTime), NULL, NULL)

SET IDENTITY_INSERT [dbo].[lkpSecureCaseNoteSubTypes] OFF
ALTER TABLE [dbo].[lkpSecureCaseNoteSubTypes]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[lkpSecureCaseNoteSubTypes]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[user_accounts] ([user_id])

