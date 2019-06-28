SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[TransactionHistory] (
		[TransactionID]            [int] IDENTITY(100000, 1) NOT NULL,
		[ProductID]                [int] NOT NULL,
		[ReferenceOrderID]         [int] NOT NULL,
		[ReferenceOrderLineID]     [int] NOT NULL,
		[TransactionDate]          [datetime] NOT NULL,
		[TransactionType]          [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Quantity]                 [int] NOT NULL,
		[ActualCost]               [money] NOT NULL,
		[ModifiedDate]             [datetime] NOT NULL,
		CONSTRAINT [PK_TransactionHistory_TransactionID]
		PRIMARY KEY
		CLUSTERED
		([TransactionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[TransactionHistory]
	CHECK CONSTRAINT [FK_TransactionHistory_Product_ProductID]

GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ProductID]
	ON [Production].[TransactionHistory] ([ProductID])
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID]
	ON [Production].[TransactionHistory] ([ReferenceOrderID], [ReferenceOrderLineID])
GO
ALTER TABLE [Production].[TransactionHistory] SET (LOCK_ESCALATION = TABLE)
GO
