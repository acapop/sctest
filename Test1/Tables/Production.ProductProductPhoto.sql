SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[ProductProductPhoto] (
		[ProductID]          [int] NOT NULL,
		[ProductPhotoID]     [int] NOT NULL,
		[Primary]            [bit] NOT NULL,
		[ModifiedDate]       [datetime] NOT NULL,
		CONSTRAINT [PK_ProductProductPhoto_ProductID_ProductPhotoID]
		PRIMARY KEY
		NONCLUSTERED
		([ProductID], [ProductPhotoID])
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductProductPhoto]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductProductPhoto]
	CHECK CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]

GO
ALTER TABLE [Production].[ProductProductPhoto]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]
	FOREIGN KEY ([ProductPhotoID]) REFERENCES [Production].[ProductPhoto] ([ProductPhotoID])
ALTER TABLE [Production].[ProductProductPhoto]
	CHECK CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]

GO
ALTER TABLE [Production].[ProductProductPhoto] SET (LOCK_ESCALATION = TABLE)
GO
