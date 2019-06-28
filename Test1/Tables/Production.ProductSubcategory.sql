SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductSubcategory] (
		[ProductSubcategoryID]     [int] IDENTITY(1, 1) NOT NULL,
		[ProductCategoryID]        [int] NOT NULL,
		[Name]                     [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[rowguid]                  [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]             [datetime] NOT NULL,
		CONSTRAINT [PK_ProductSubcategory_ProductSubcategoryID]
		PRIMARY KEY
		CLUSTERED
		([ProductSubcategoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductSubcategory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]
	FOREIGN KEY ([ProductCategoryID]) REFERENCES [Production].[ProductCategory] ([ProductCategoryID])
ALTER TABLE [Production].[ProductSubcategory]
	CHECK CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_Name]
	ON [Production].[ProductSubcategory] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_rowguid]
	ON [Production].[ProductSubcategory] ([rowguid])
GO
ALTER TABLE [Production].[ProductSubcategory] SET (LOCK_ESCALATION = TABLE)
GO
