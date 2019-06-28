SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SalesTerritoryHistory] (
		[BusinessEntityID]     [int] NOT NULL,
		[TerritoryID]          [int] NOT NULL,
		[StartDate]            [datetime] NOT NULL,
		[EndDate]              [datetime] NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [StartDate], [TerritoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesTerritoryHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesTerritoryHistory]
	CHECK CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]

GO
ALTER TABLE [Sales].[SalesTerritoryHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesTerritoryHistory]
	CHECK CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritoryHistory_rowguid]
	ON [Sales].[SalesTerritoryHistory] ([rowguid])
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] SET (LOCK_ESCALATION = TABLE)
GO
