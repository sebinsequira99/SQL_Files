/****** Object:  Table [dbo].[SecureCaseNoteSubTypes]    Script Date: 09-06-2015 11:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecureCaseNoteSubTypes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[SecureNoteTypeID] [int] NULL,
	[SecureNoteSubTypeID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Modifieddate] [datetime] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SecureCaseNoteSubTypes]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[SecureCaseNoteSubTypes]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[user_accounts] ([user_id])
GO
ALTER TABLE [dbo].[SecureCaseNoteSubTypes]  WITH CHECK ADD  CONSTRAINT [FK_SecureCaseNoteSubTypes_SecureNoteSubTypeID] FOREIGN KEY([SecureNoteSubTypeID])
REFERENCES [dbo].[lkpSecureCaseNoteSubTypes] ([SubTypeID])
GO
ALTER TABLE [dbo].[SecureCaseNoteSubTypes] CHECK CONSTRAINT [FK_SecureCaseNoteSubTypes_SecureNoteSubTypeID]
GO
ALTER TABLE [dbo].[SecureCaseNoteSubTypes]  WITH CHECK ADD  CONSTRAINT [FK_SecureCaseNoteSubTypes_securenotetypeid] FOREIGN KEY([SecureNoteTypeID])
REFERENCES [dbo].[lkpActType] ([ActTypeId])
GO
ALTER TABLE [dbo].[SecureCaseNoteSubTypes] CHECK CONSTRAINT [FK_SecureCaseNoteSubTypes_securenotetypeid]
GO
