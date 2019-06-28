SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Location] (
		[LocationID]       [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]             [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CostRate]         [smallmoney] NOT NULL,
		[Availability]     [decimal](8, 2) NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Location_LocationID]
		PRIMARY KEY
		CLUSTERED
		([LocationID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Location_Name]
	ON [Production].[Location] ([Name])
GO
ALTER TABLE [Production].[Location] SET (LOCK_ESCALATION = TABLE)
GO
