SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [HumanResources].[EmployeePayHistory] (
		[BusinessEntityID]     [int] NOT NULL,
		[RateChangeDate]       [datetime] NOT NULL,
		[Rate]                 [money] NOT NULL,
		[PayFrequency]         [tinyint] NOT NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [RateChangeDate])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[EmployeePayHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [HumanResources].[EmployeePayHistory]
	CHECK CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID]

GO
ALTER TABLE [HumanResources].[EmployeePayHistory] SET (LOCK_ESCALATION = TABLE)
GO
