SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[UnitMeasure] (
		[UnitMeasureCode]     [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Name]                [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]        [datetime] NOT NULL,
		CONSTRAINT [PK_UnitMeasure_UnitMeasureCode]
		PRIMARY KEY
		CLUSTERED
		([UnitMeasureCode])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_UnitMeasure_Name]
	ON [Production].[UnitMeasure] ([Name])
GO
ALTER TABLE [Production].[UnitMeasure] SET (LOCK_ESCALATION = TABLE)
GO
