SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[WorkOrderRouting] (
		[WorkOrderID]            [int] NOT NULL,
		[ProductID]              [int] NOT NULL,
		[OperationSequence]      [smallint] NOT NULL,
		[LocationID]             [smallint] NOT NULL,
		[ScheduledStartDate]     [datetime] NOT NULL,
		[ScheduledEndDate]       [datetime] NOT NULL,
		[ActualStartDate]        [datetime] NULL,
		[ActualEndDate]          [datetime] NULL,
		[ActualResourceHrs]      [decimal](9, 4) NULL,
		[PlannedCost]            [money] NOT NULL,
		[ActualCost]             [money] NULL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence]
		PRIMARY KEY
		CLUSTERED
		([WorkOrderID], [ProductID], [OperationSequence])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	WITH CHECK
	ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]
	FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID])
ALTER TABLE [Production].[WorkOrderRouting]
	CHECK CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]

GO
ALTER TABLE [Production].[WorkOrderRouting]
	WITH CHECK
	ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]
	FOREIGN KEY ([WorkOrderID]) REFERENCES [Production].[WorkOrder] ([WorkOrderID])
ALTER TABLE [Production].[WorkOrderRouting]
	CHECK CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]

GO
CREATE NONCLUSTERED INDEX [IX_WorkOrderRouting_ProductID]
	ON [Production].[WorkOrderRouting] ([ProductID])
GO
ALTER TABLE [Production].[WorkOrderRouting] SET (LOCK_ESCALATION = TABLE)
GO
