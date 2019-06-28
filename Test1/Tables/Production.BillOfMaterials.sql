SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[BillOfMaterials] (
		[BillOfMaterialsID]     [int] IDENTITY(1, 1) NOT NULL,
		[ProductAssemblyID]     [int] NULL,
		[ComponentID]           [int] NOT NULL,
		[StartDate]             [datetime] NOT NULL,
		[EndDate]               [datetime] NULL,
		[UnitMeasureCode]       [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[BOMLevel]              [smallint] NOT NULL,
		[PerAssemblyQty]        [decimal](8, 2) NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_BillOfMaterials_BillOfMaterialsID]
		PRIMARY KEY
		NONCLUSTERED
		([BillOfMaterialsID])
) ON [PRIMARY]
GO
ALTER TABLE [Production].[BillOfMaterials]
	WITH CHECK
	ADD CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]
	FOREIGN KEY ([ProductAssemblyID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[BillOfMaterials]
	CHECK CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]

GO
ALTER TABLE [Production].[BillOfMaterials]
	WITH CHECK
	ADD CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]
	FOREIGN KEY ([ComponentID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[BillOfMaterials]
	CHECK CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]

GO
ALTER TABLE [Production].[BillOfMaterials]
	WITH CHECK
	ADD CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
	FOREIGN KEY ([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[BillOfMaterials]
	CHECK CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]

GO
CREATE UNIQUE CLUSTERED INDEX [AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate]
	ON [Production].[BillOfMaterials] ([ProductAssemblyID], [ComponentID], [StartDate])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BillOfMaterials_UnitMeasureCode]
	ON [Production].[BillOfMaterials] ([UnitMeasureCode])
GO
ALTER TABLE [Production].[BillOfMaterials] SET (LOCK_ESCALATION = TABLE)
GO
