SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[PurchaseOrderHeader] (
		[PurchaseOrderID]     [int] IDENTITY(1, 1) NOT NULL,
		[RevisionNumber]      [tinyint] NOT NULL,
		[Status]              [tinyint] NOT NULL,
		[EmployeeID]          [int] NOT NULL,
		[VendorID]            [int] NOT NULL,
		[ShipMethodID]        [int] NOT NULL,
		[OrderDate]           [datetime] NOT NULL,
		[ShipDate]            [datetime] NULL,
		[SubTotal]            [money] NOT NULL,
		[TaxAmt]              [money] NOT NULL,
		[Freight]             [money] NOT NULL,
		[TotalDue]            AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))) PERSISTED NOT NULL,
		[ModifiedDate]        [datetime] NOT NULL,
		CONSTRAINT [PK_PurchaseOrderHeader_PurchaseOrderID]
		PRIMARY KEY
		CLUSTERED
		([PurchaseOrderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID]
	FOREIGN KEY ([EmployeeID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [Purchasing].[PurchaseOrderHeader]
	CHECK CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID]

GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID]
	FOREIGN KEY ([VendorID]) REFERENCES [Purchasing].[Vendor] ([BusinessEntityID])
ALTER TABLE [Purchasing].[PurchaseOrderHeader]
	CHECK CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID]

GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
	FOREIGN KEY ([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])
ALTER TABLE [Purchasing].[PurchaseOrderHeader]
	CHECK CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]

GO
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderHeader_VendorID]
	ON [Purchasing].[PurchaseOrderHeader] ([VendorID])
GO
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderHeader_EmployeeID]
	ON [Purchasing].[PurchaseOrderHeader] ([EmployeeID])
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] SET (LOCK_ESCALATION = TABLE)
GO
