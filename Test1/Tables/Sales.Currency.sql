SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Currency] (
		[CurrencyCode]     [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Name]             [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Currency_CurrencyCode]
		PRIMARY KEY
		CLUSTERED
		([CurrencyCode])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Currency_Name]
	ON [Sales].[Currency] ([Name])
GO
ALTER TABLE [Sales].[Currency] SET (LOCK_ESCALATION = TABLE)
GO
