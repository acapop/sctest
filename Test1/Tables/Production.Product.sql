SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Product] (
		[ProductID]                 [int] IDENTITY(1, 1) NOT NULL,
		[Name]                      [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ProductNumber]             [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[MakeFlag]                  [bit] NOT NULL,
		[FinishedGoodsFlag]         [bit] NOT NULL,
		[Color]                     [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[SafetyStockLevel]          [smallint] NOT NULL,
		[ReorderPoint]              [smallint] NOT NULL,
		[StandardCost]              [money] NOT NULL,
		[ListPrice]                 [money] NOT NULL,
		[Size]                      [nvarchar](5) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[SizeUnitMeasureCode]       [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[WeightUnitMeasureCode]     [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Weight]                    [decimal](8, 2) NULL,
		[DaysToManufacture]         [int] NOT NULL,
		[ProductLine]               [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Class]                     [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Style]                     [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ProductSubcategoryID]      [int] NULL,
		[ProductModelID]            [int] NULL,
		[SellStartDate]             [datetime] NOT NULL,
		[SellEndDate]               [datetime] NULL,
		[DiscontinuedDate]          [datetime] NULL,
		[rowguid]                   [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]              [datetime] NOT NULL,
		CONSTRAINT [PK_Product_ProductID]
		PRIMARY KEY
		CLUSTERED
		([ProductID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]
	FOREIGN KEY ([SizeUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]

GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]
	FOREIGN KEY ([WeightUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]

GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
	FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_ProductModel_ProductModelID]

GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]
	FOREIGN KEY ([ProductSubcategoryID]) REFERENCES [Production].[ProductSubcategory] ([ProductSubcategoryID])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_ProductNumber]
	ON [Production].[Product] ([ProductNumber])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_Name]
	ON [Production].[Product] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_rowguid]
	ON [Production].[Product] ([rowguid])
GO
ALTER TABLE [Production].[Product] SET (LOCK_ESCALATION = TABLE)
GO
