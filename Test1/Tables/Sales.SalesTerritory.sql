SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesTerritory] (
		[TerritoryID]           [int] IDENTITY(1, 1) NOT NULL,
		[Name]                  [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CountryRegionCode]     [nvarchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Group]                 [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[SalesYTD]              [money] NOT NULL,
		[SalesLastYear]         [money] NOT NULL,
		[CostYTD]               [money] NOT NULL,
		[CostLastYear]          [money] NOT NULL,
		[rowguid]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_SalesTerritory_TerritoryID]
		PRIMARY KEY
		CLUSTERED
		([TerritoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesTerritory]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode]
	FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
ALTER TABLE [Sales].[SalesTerritory]
	CHECK CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritory_Name]
	ON [Sales].[SalesTerritory] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritory_rowguid]
	ON [Sales].[SalesTerritory] ([rowguid])
GO
ALTER TABLE [Sales].[SalesTerritory] SET (LOCK_ESCALATION = TABLE)
GO
