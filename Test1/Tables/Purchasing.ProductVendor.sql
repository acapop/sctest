SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[ProductVendor] (
		[ProductID]            [int] NOT NULL,
		[BusinessEntityID]     [int] NOT NULL,
		[AverageLeadTime]      [int] NOT NULL,
		[StandardPrice]        [money] NOT NULL,
		[LastReceiptCost]      [money] NULL,
		[LastReceiptDate]      [datetime] NULL,
		[MinOrderQty]          [int] NOT NULL,
		[MaxOrderQty]          [int] NOT NULL,
		[OnOrderQty]           [int] NULL,
		[UnitMeasureCode]      [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([ProductID], [BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[ProductVendor]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductVendor_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Purchasing].[ProductVendor]
	CHECK CONSTRAINT [FK_ProductVendor_Product_ProductID]

GO
ALTER TABLE [Purchasing].[ProductVendor]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
	FOREIGN KEY ([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Purchasing].[ProductVendor]
	CHECK CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]

GO
ALTER TABLE [Purchasing].[ProductVendor]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Purchasing].[Vendor] ([BusinessEntityID])
ALTER TABLE [Purchasing].[ProductVendor]
	CHECK CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]

GO
CREATE NONCLUSTERED INDEX [IX_ProductVendor_UnitMeasureCode]
	ON [Purchasing].[ProductVendor] ([UnitMeasureCode])
GO
CREATE NONCLUSTERED INDEX [IX_ProductVendor_BusinessEntityID]
	ON [Purchasing].[ProductVendor] ([BusinessEntityID])
GO
ALTER TABLE [Purchasing].[ProductVendor] SET (LOCK_ESCALATION = TABLE)
GO
