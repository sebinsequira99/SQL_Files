USE [MAPDEV]
GO

/****** Object:  Table [dbo].[lkpActType]    Script Date: 09-06-2015 11:08:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lkpActType](
	[ActTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ActTypeText] [nvarchar](100) NULL,
	[isDurationCount] [bit] NULL,
	[isOutReach] [bit] NULL,
	[isActive] [bit] NULL,
	[isSecure] [bit] NULL,
	[programID] [int] NULL,
 CONSTRAINT [aaaaalkpActType_PK] PRIMARY KEY CLUSTERED 
(
	[ActTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[lkpActType] ADD  DEFAULT ('0') FOR [isDurationCount]
GO

ALTER TABLE [dbo].[lkpActType] ADD  DEFAULT ('0') FOR [isOutReach]
GO

ALTER TABLE [dbo].[lkpActType] ADD  DEFAULT ((1)) FOR [isActive]
GO

