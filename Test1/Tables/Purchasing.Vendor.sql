SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[Vendor] (
		[BusinessEntityID]            [int] NOT NULL,
		[AccountNumber]               [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Name]                        [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CreditRating]                [tinyint] NOT NULL,
		[PreferredVendorStatus]       [bit] NOT NULL,
		[ActiveFlag]                  [bit] NOT NULL,
		[PurchasingWebServiceURL]     [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ModifiedDate]                [datetime] NOT NULL,
		CONSTRAINT [PK_Vendor_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[Vendor]
	WITH CHECK
	ADD CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Purchasing].[Vendor]
	CHECK CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Vendor_AccountNumber]
	ON [Purchasing].[Vendor] ([AccountNumber])
GO
ALTER TABLE [Purchasing].[Vendor] SET (LOCK_ESCALATION = TABLE)
GO
