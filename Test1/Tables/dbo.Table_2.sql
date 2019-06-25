SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_2] (
		[New_column_1]      [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_2]      [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_3]      [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Table_1_Id_FK]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_2]
	WITH CHECK
	ADD CONSTRAINT [Table_2_Table_1_FK]
	FOREIGN KEY ([Table_1_Id_FK]) REFERENCES [dbo].[Table_1] ([Table_1_Id])
ALTER TABLE [dbo].[Table_2]
	CHECK CONSTRAINT [Table_2_Table_1_FK]

GO
ALTER TABLE [dbo].[Table_2] SET (LOCK_ESCALATION = TABLE)
GO
