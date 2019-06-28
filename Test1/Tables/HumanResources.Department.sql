SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Department] (
		[DepartmentID]     [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]             [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[GroupName]        [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Department_DepartmentID]
		PRIMARY KEY
		CLUSTERED
		([DepartmentID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Department_Name]
	ON [HumanResources].[Department] ([Name])
GO
ALTER TABLE [HumanResources].[Department] SET (LOCK_ESCALATION = TABLE)
GO
