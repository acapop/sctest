SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[ShoppingCartItem] (
		[ShoppingCartItemID]     [int] IDENTITY(1, 1) NOT NULL,
		[ShoppingCartID]         [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Quantity]               [int] NOT NULL,
		[ProductID]              [int] NOT NULL,
		[DateCreated]            [datetime] NOT NULL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID]
		PRIMARY KEY
		CLUSTERED
		([ShoppingCartItemID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[ShoppingCartItem]
	WITH CHECK
	ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Sales].[ShoppingCartItem]
	CHECK CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]

GO
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID]
	ON [Sales].[ShoppingCartItem] ([ShoppingCartID], [ProductID])
GO
ALTER TABLE [Sales].[ShoppingCartItem] SET (LOCK_ESCALATION = TABLE)
GO
