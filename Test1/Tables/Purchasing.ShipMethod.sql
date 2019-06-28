SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[ShipMethod] (
		[ShipMethodID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]             [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ShipBase]         [money] NOT NULL,
		[ShipRate]         [money] NOT NULL,
		[rowguid]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_ShipMethod_ShipMethodID]
		PRIMARY KEY
		CLUSTERED
		([ShipMethodID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_Name]
	ON [Purchasing].[ShipMethod] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_rowguid]
	ON [Purchasing].[ShipMethod] ([rowguid])
GO
ALTER TABLE [Purchasing].[ShipMethod] SET (LOCK_ESCALATION = TABLE)
GO
