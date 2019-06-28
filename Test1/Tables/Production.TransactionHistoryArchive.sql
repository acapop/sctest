SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[TransactionHistoryArchive] (
		[TransactionID]            [int] NOT NULL,
		[ProductID]                [int] NOT NULL,
		[ReferenceOrderID]         [int] NOT NULL,
		[ReferenceOrderLineID]     [int] NOT NULL,
		[TransactionDate]          [datetime] NOT NULL,
		[TransactionType]          [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Quantity]                 [int] NOT NULL,
		[ActualCost]               [money] NOT NULL,
		[ModifiedDate]             [datetime] NOT NULL,
		CONSTRAINT [PK_TransactionHistoryArchive_TransactionID]
		PRIMARY KEY
		CLUSTERED
		([TransactionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ProductID]
	ON [Production].[TransactionHistoryArchive] ([ProductID])
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID]
	ON [Production].[TransactionHistoryArchive] ([ReferenceOrderID], [ReferenceOrderLineID])
GO
ALTER TABLE [Production].[TransactionHistoryArchive] SET (LOCK_ESCALATION = TABLE)
GO
