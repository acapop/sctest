SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductModel] (
		[ProductModelID]         [int] IDENTITY(1, 1) NOT NULL,
		[Name]                   [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CatalogDescription]     [xml](CONTENT [Production].[ProductDescriptionSchemaCollection]) NULL,
		[Instructions]           [xml](CONTENT [Production].[ManuInstructionsSchemaCollection]) NULL,
		[rowguid]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [PK_ProductModel_ProductModelID]
		PRIMARY KEY
		CLUSTERED
		([ProductModelID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_Name]
	ON [Production].[ProductModel] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_rowguid]
	ON [Production].[ProductModel] ([rowguid])
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
	ON [Production].[ProductModel] ([CatalogDescription])
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_Instructions]
	ON [Production].[ProductModel] ([Instructions])
GO
ALTER TABLE [Production].[ProductModel] SET (LOCK_ESCALATION = TABLE)
GO
