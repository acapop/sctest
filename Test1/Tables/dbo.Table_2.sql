SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_2] (
		[New_column_1]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_2]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_3]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_4]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_5]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_2] SET (LOCK_ESCALATION = TABLE)
GO
