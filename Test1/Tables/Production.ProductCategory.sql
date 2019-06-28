SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductCategory] (
		[ProductCategoryID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]                  [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[rowguid]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_ProductCategory_ProductCategoryID]
		PRIMARY KEY
		CLUSTERED
		([ProductCategoryID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name]
	ON [Production].[ProductCategory] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_rowguid]
	ON [Production].[ProductCategory] ([rowguid])
GO
ALTER TABLE [Production].[ProductCategory] SET (LOCK_ESCALATION = TABLE)
GO
