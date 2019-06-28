SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[PurchaseOrderDetail] (
		[PurchaseOrderID]           [int] NOT NULL,
		[PurchaseOrderDetailID]     [int] IDENTITY(1, 1) NOT NULL,
		[DueDate]                   [datetime] NOT NULL,
		[OrderQty]                  [smallint] NOT NULL,
		[ProductID]                 [int] NOT NULL,
		[UnitPrice]                 [money] NOT NULL,
		[LineTotal]                 AS (isnull([OrderQty]*[UnitPrice],(0.00))),
		[ReceivedQty]               [decimal](8, 2) NOT NULL,
		[RejectedQty]               [decimal](8, 2) NOT NULL,
		[StockedQty]                AS (isnull([ReceivedQty]-[RejectedQty],(0.00))),
		[ModifiedDate]              [datetime] NOT NULL,
		CONSTRAINT [PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID]
		PRIMARY KEY
		CLUSTERED
		([PurchaseOrderID], [PurchaseOrderDetailID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail]
	WITH CHECK
	ADD CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Purchasing].[PurchaseOrderDetail]
	CHECK CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]

GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail]
	WITH CHECK
	ADD CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]
	FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrderHeader] ([PurchaseOrderID])
ALTER TABLE [Purchasing].[PurchaseOrderDetail]
	CHECK CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]

GO
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_ProductID]
	ON [Purchasing].[PurchaseOrderDetail] ([ProductID])
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] SET (LOCK_ESCALATION = TABLE)
GO
