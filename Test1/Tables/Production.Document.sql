SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Document] (
		[DocumentNode]        [hierarchyid] NOT NULL,
		[DocumentLevel]       AS ([DocumentNode].[GetLevel]()),
		[Title]               [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Owner]               [int] NOT NULL,
		[FolderFlag]          [bit] NOT NULL,
		[FileName]            [nvarchar](400) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[FileExtension]       [nvarchar](8) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Revision]            [nchar](5) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ChangeNumber]        [int] NOT NULL,
		[Status]              [tinyint] NOT NULL,
		[DocumentSummary]     [nvarchar](max) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Document]            [varbinary](max) NULL,
		[rowguid]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]        [datetime] NOT NULL,
		[New_column_1]        [nchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		CONSTRAINT [PK_Document_DocumentNode]
		PRIMARY KEY
		CLUSTERED
		([DocumentNode])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Document]
	WITH CHECK
	ADD CONSTRAINT [FK_Document_Employee_Owner]
	FOREIGN KEY ([Owner]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [Production].[Document]
	CHECK CONSTRAINT [FK_Document_Employee_Owner]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_DocumentLevel_DocumentNode]
	ON [Production].[Document] ([DocumentLevel], [DocumentNode])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_rowguid]
	ON [Production].[Document] ([rowguid])
GO
CREATE NONCLUSTERED INDEX [IX_Document_FileName_Revision]
	ON [Production].[Document] ([FileName], [Revision])
GO
CREATE FULLTEXT INDEX ON [Production].[Document]
	([DocumentSummary] LANGUAGE 1033, [Document] LANGUAGE 1033)
	KEY INDEX [PK_Document_DocumentNode]
	ON (FILEGROUP [PRIMARY], [AW2014FullTextCatalog])
	WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO
ALTER TABLE [Production].[Document] SET (LOCK_ESCALATION = TABLE)
GO
