SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesTaxRate] (
		[SalesTaxRateID]      [int] IDENTITY(1, 1) NOT NULL,
		[StateProvinceID]     [int] NOT NULL,
		[TaxType]             [tinyint] NOT NULL,
		[TaxRate]             [smallmoney] NOT NULL,
		[Name]                [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[rowguid]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]        [datetime] NOT NULL,
		CONSTRAINT [PK_SalesTaxRate_SalesTaxRateID]
		PRIMARY KEY
		CLUSTERED
		([SalesTaxRateID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesTaxRate]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]
	FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
ALTER TABLE [Sales].[SalesTaxRate]
	CHECK CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_StateProvinceID_TaxType]
	ON [Sales].[SalesTaxRate] ([StateProvinceID], [TaxType])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_rowguid]
	ON [Sales].[SalesTaxRate] ([rowguid])
GO
ALTER TABLE [Sales].[SalesTaxRate] SET (LOCK_ESCALATION = TABLE)
GO
