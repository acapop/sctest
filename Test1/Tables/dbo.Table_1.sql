SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1] (
		[New_column_1]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[New_column_2]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_3]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_4]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		CONSTRAINT [Table_1_PK]
		PRIMARY KEY
		NONCLUSTERED
		([New_column_1])
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [New_column_2_AK]
	ON [dbo].[Table_1] ([New_column_2])
GO
ALTER TABLE [dbo].[Table_1] SET (LOCK_ESCALATION = TABLE)
GO
