SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SpecialOffer] (
		[SpecialOfferID]     [int] IDENTITY(1, 1) NOT NULL,
		[Description]        [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[DiscountPct]        [smallmoney] NOT NULL,
		[Type]               [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Category]           [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[StartDate]          [datetime] NOT NULL,
		[EndDate]            [datetime] NOT NULL,
		[MinQty]             [int] NOT NULL,
		[MaxQty]             [int] NULL,
		[rowguid]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]       [datetime] NOT NULL,
		CONSTRAINT [PK_SpecialOffer_SpecialOfferID]
		PRIMARY KEY
		CLUSTERED
		([SpecialOfferID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOffer_rowguid]
	ON [Sales].[SpecialOffer] ([rowguid])
GO
ALTER TABLE [Sales].[SpecialOffer] SET (LOCK_ESCALATION = TABLE)
GO
