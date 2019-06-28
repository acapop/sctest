SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SalesPerson] (
		[BusinessEntityID]     [int] NOT NULL,
		[TerritoryID]          [int] NULL,
		[SalesQuota]           [money] NULL,
		[Bonus]                [money] NOT NULL,
		[CommissionPct]        [smallmoney] NOT NULL,
		[SalesYTD]             [money] NOT NULL,
		[SalesLastYear]        [money] NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_SalesPerson_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPerson]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesPerson]
	CHECK CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]

GO
ALTER TABLE [Sales].[SalesPerson]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesPerson]
	CHECK CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPerson_rowguid]
	ON [Sales].[SalesPerson] ([rowguid])
GO
ALTER TABLE [Sales].[SalesPerson] SET (LOCK_ESCALATION = TABLE)
GO
