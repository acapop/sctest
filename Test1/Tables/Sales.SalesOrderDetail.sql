SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesOrderDetail] (
		[SalesOrderID]              [int] NOT NULL,
		[SalesOrderDetailID]        [int] IDENTITY(1, 1) NOT NULL,
		[CarrierTrackingNumber]     [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[OrderQty]                  [smallint] NOT NULL,
		[ProductID]                 [int] NOT NULL,
		[SpecialOfferID]            [int] NOT NULL,
		[UnitPrice]                 [money] NOT NULL,
		[UnitPriceDiscount]         [money] NOT NULL,
		[LineTotal]                 AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
		[rowguid]                   [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]              [datetime] NOT NULL,
		CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID], [SalesOrderDetailID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderDetail]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
	FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader] ([SalesOrderID])
ALTER TABLE [Sales].[SalesOrderDetail]
	CHECK CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]

GO
ALTER TABLE [Sales].[SalesOrderDetail]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
	FOREIGN KEY ([SpecialOfferID], [ProductID]) REFERENCES [Sales].[SpecialOfferProduct] ([SpecialOfferID], [ProductID])
ALTER TABLE [Sales].[SalesOrderDetail]
	CHECK CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderDetail_rowguid]
	ON [Sales].[SalesOrderDetail] ([rowguid])
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_ProductID]
	ON [Sales].[SalesOrderDetail] ([ProductID])
GO
ALTER TABLE [Sales].[SalesOrderDetail] SET (LOCK_ESCALATION = TABLE)
GO
