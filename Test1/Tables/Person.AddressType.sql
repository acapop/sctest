SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[AddressType] (
		[AddressTypeID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]              [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[rowguid]           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_AddressType_AddressTypeID]
		PRIMARY KEY
		CLUSTERED
		([AddressTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_rowguid]
	ON [Person].[AddressType] ([rowguid])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_Name]
	ON [Person].[AddressType] ([Name])
GO
ALTER TABLE [Person].[AddressType] SET (LOCK_ESCALATION = TABLE)
GO
