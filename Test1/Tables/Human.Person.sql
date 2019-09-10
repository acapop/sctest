SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Human].[Person] (
		[Id]                [float] NOT NULL,
		[FirstName]         [varchar](20) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[LastName]          [text] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Phone]             [varchar](15) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Location]          [varchar](20) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[LicenseNumber]     [int] NOT NULL,
		[Gender]            [nvarchar](1) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		CONSTRAINT [Person_PK]
		PRIMARY KEY
		NONCLUSTERED
		([Id])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [LicenseNumber_AK]
	ON [Human].[Person] ([LicenseNumber])
GO
ALTER TABLE [Human].[Person] SET (LOCK_ESCALATION = TABLE)
GO
