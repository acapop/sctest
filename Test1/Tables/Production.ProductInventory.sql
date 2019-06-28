SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductInventory] (
		[ProductID]        [int] NOT NULL,
		[LocationID]       [smallint] NOT NULL,
		[Shelf]            [nvarchar](10) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Bin]              [tinyint] NOT NULL,
		[Quantity]         [smallint] NOT NULL,
		[rowguid]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_ProductInventory_ProductID_LocationID]
		PRIMARY KEY
		CLUSTERED
		([ProductID], [LocationID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductInventory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductInventory_Location_LocationID]
	FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID])
ALTER TABLE [Production].[ProductInventory]
	CHECK CONSTRAINT [FK_ProductInventory_Location_LocationID]

GO
ALTER TABLE [Production].[ProductInventory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductInventory_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductInventory]
	CHECK CONSTRAINT [FK_ProductInventory_Product_ProductID]

GO
ALTER TABLE [Production].[ProductInventory] SET (LOCK_ESCALATION = TABLE)
GO
