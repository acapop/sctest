SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesOrderHeader] (
		[SalesOrderID]               [int] IDENTITY(1, 1) NOT NULL,
		[RevisionNumber]             [tinyint] NOT NULL,
		[OrderDate]                  [datetime] NOT NULL,
		[DueDate]                    [datetime] NOT NULL,
		[ShipDate]                   [datetime] NULL,
		[Status]                     [tinyint] NOT NULL,
		[OnlineOrderFlag]            [bit] NOT NULL,
		[SalesOrderNumber]           AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
		[PurchaseOrderNumber]        [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[AccountNumber]              [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[CustomerID]                 [int] NOT NULL,
		[SalesPersonID]              [int] NULL,
		[TerritoryID]                [int] NULL,
		[BillToAddressID]            [int] NOT NULL,
		[ShipToAddressID]            [int] NOT NULL,
		[ShipMethodID]               [int] NOT NULL,
		[CreditCardID]               [int] NULL,
		[CreditCardApprovalCode]     [varchar](15) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[CurrencyRateID]             [int] NULL,
		[SubTotal]                   [money] NOT NULL,
		[TaxAmt]                     [money] NOT NULL,
		[Freight]                    [money] NOT NULL,
		[TotalDue]                   AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
		[Comment]                    [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[rowguid]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]               [datetime] NOT NULL,
		CONSTRAINT [PK_SalesOrderHeader_SalesOrderID]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]
	FOREIGN KEY ([BillToAddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]
	FOREIGN KEY ([ShipToAddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]
	FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
	FOREIGN KEY ([CurrencyRateID]) REFERENCES [Sales].[CurrencyRate] ([CurrencyRateID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
	FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
	FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
	FOREIGN KEY ([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_rowguid]
	ON [Sales].[SalesOrderHeader] ([rowguid])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_SalesOrderNumber]
	ON [Sales].[SalesOrderHeader] ([SalesOrderNumber])
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
	ON [Sales].[SalesOrderHeader] ([CustomerID])
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_SalesPersonID]
	ON [Sales].[SalesOrderHeader] ([SalesPersonID])
GO
ALTER TABLE [Sales].[SalesOrderHeader] SET (LOCK_ESCALATION = TABLE)
GO
