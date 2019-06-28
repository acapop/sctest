SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_3] (
		[New_column_1]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[New_column_2]     [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_3] SET (LOCK_ESCALATION = TABLE)
GO
