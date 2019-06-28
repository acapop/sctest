SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Person].[BusinessEntity] (
		[BusinessEntityID]     [int] IDENTITY(1, 1) NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_BusinessEntity_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntity_rowguid]
	ON [Person].[BusinessEntity] ([rowguid])
GO
ALTER TABLE [Person].[BusinessEntity] SET (LOCK_ESCALATION = TABLE)
GO
