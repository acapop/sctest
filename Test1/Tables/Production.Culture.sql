SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Culture] (
		[CultureID]        [nchar](6) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Name]             [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Culture_CultureID]
		PRIMARY KEY
		CLUSTERED
		([CultureID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Culture_Name]
	ON [Production].[Culture] ([Name])
GO
ALTER TABLE [Production].[Culture] SET (LOCK_ESCALATION = TABLE)
GO
