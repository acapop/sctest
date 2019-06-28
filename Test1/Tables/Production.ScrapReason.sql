SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ScrapReason] (
		[ScrapReasonID]     [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]              [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_ScrapReason_ScrapReasonID]
		PRIMARY KEY
		CLUSTERED
		([ScrapReasonID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ScrapReason_Name]
	ON [Production].[ScrapReason] ([Name])
GO
ALTER TABLE [Production].[ScrapReason] SET (LOCK_ESCALATION = TABLE)
GO
