SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[ContactType] (
		[ContactTypeID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]              [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_ContactType_ContactTypeID]
		PRIMARY KEY
		CLUSTERED
		([ContactTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ContactType_Name]
	ON [Person].[ContactType] ([Name])
GO
ALTER TABLE [Person].[ContactType] SET (LOCK_ESCALATION = TABLE)
GO
