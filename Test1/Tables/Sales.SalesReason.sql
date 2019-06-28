SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesReason] (
		[SalesReasonID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]              [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ReasonType]        [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_SalesReason_SalesReasonID]
		PRIMARY KEY
		CLUSTERED
		([SalesReasonID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesReason] SET (LOCK_ESCALATION = TABLE)
GO
