SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Customer] (
		[CustomerID]        [int] IDENTITY(1, 1) NOT NULL,
		[PersonID]          [int] NULL,
		[StoreID]           [int] NULL,
		[TerritoryID]       [int] NULL,
		[AccountNumber]     AS (isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),'')),
		[rowguid]           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_Customer_CustomerID]
		PRIMARY KEY
		CLUSTERED
		([CustomerID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[Customer]
	WITH CHECK
	ADD CONSTRAINT [FK_Customer_Person_PersonID]
	FOREIGN KEY ([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Sales].[Customer]
	CHECK CONSTRAINT [FK_Customer_Person_PersonID]

GO
ALTER TABLE [Sales].[Customer]
	WITH CHECK
	ADD CONSTRAINT [FK_Customer_Store_StoreID]
	FOREIGN KEY ([StoreID]) REFERENCES [Sales].[Store] ([BusinessEntityID])
ALTER TABLE [Sales].[Customer]
	CHECK CONSTRAINT [FK_Customer_Store_StoreID]

GO
ALTER TABLE [Sales].[Customer]
	WITH CHECK
	ADD CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[Customer]
	CHECK CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_rowguid]
	ON [Sales].[Customer] ([rowguid])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_AccountNumber]
	ON [Sales].[Customer] ([AccountNumber])
GO
CREATE NONCLUSTERED INDEX [IX_Customer_TerritoryID]
	ON [Sales].[Customer] ([TerritoryID])
GO
ALTER TABLE [Sales].[Customer] SET (LOCK_ESCALATION = TABLE)
GO
