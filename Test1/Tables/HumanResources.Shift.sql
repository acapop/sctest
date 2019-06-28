SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Shift] (
		[ShiftID]          [tinyint] IDENTITY(1, 1) NOT NULL,
		[Name]             [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[StartTime]        [time](7) NOT NULL,
		[EndTime]          [time](7) NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Shift_ShiftID]
		PRIMARY KEY
		CLUSTERED
		([ShiftID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_Name]
	ON [HumanResources].[Shift] ([Name])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_StartTime_EndTime]
	ON [HumanResources].[Shift] ([StartTime], [EndTime])
GO
ALTER TABLE [HumanResources].[Shift] SET (LOCK_ESCALATION = TABLE)
GO
