SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Employee] (
		[BusinessEntityID]      [int] NOT NULL,
		[NationalIDNumber]      [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[LoginID]               [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[OrganizationNode]      [hierarchyid] NULL,
		[OrganizationLevel]     AS ([OrganizationNode].[GetLevel]()),
		[JobTitle]              [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[BirthDate]             [date] NOT NULL,
		[MaritalStatus]         [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Gender]                [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[HireDate]              [date] NOT NULL,
		[SalariedFlag]          [bit] NOT NULL,
		[VacationHours]         [smallint] NOT NULL,
		[SickLeaveHours]        [smallint] NOT NULL,
		[CurrentFlag]           [bit] NOT NULL,
		[rowguid]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_Employee_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Employee]
	WITH CHECK
	ADD CONSTRAINT [FK_Employee_Person_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [HumanResources].[Employee]
	CHECK CONSTRAINT [FK_Employee_Person_BusinessEntityID]

GO
CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationNode]
	ON [HumanResources].[Employee] ([OrganizationNode])
GO
CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationLevel_OrganizationNode]
	ON [HumanResources].[Employee] ([OrganizationLevel], [OrganizationNode])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_LoginID]
	ON [HumanResources].[Employee] ([LoginID])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_NationalIDNumber]
	ON [HumanResources].[Employee] ([NationalIDNumber])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_rowguid]
	ON [HumanResources].[Employee] ([rowguid])
GO
ALTER TABLE [HumanResources].[Employee] SET (LOCK_ESCALATION = TABLE)
GO
