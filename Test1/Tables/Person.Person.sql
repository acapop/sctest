SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Person] (
		[BusinessEntityID]          [int] NOT NULL,
		[PersonType]                [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[NameStyle]                 [bit] NOT NULL,
		[Title]                     [nvarchar](8) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[FirstName]                 [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[MiddleName]                [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[LastName]                  [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Suffix]                    [nvarchar](10) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[EmailPromotion]            [int] NOT NULL,
		[AdditionalContactInfo]     [xml](CONTENT [Person].[AdditionalContactInfoSchemaCollection]) NULL,
		[Demographics]              [xml](CONTENT [Person].[IndividualSurveySchemaCollection]) NULL,
		[rowguid]                   [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]              [datetime] NOT NULL,
		CONSTRAINT [PK_Person_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Person].[Person]
	WITH CHECK
	ADD CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Person].[Person]
	CHECK CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID]

GO
CREATE NONCLUSTERED INDEX [IX_Person_LastName_FirstName_MiddleName]
	ON [Person].[Person] ([LastName], [FirstName], [MiddleName])
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Person_rowguid]
	ON [Person].[Person] ([rowguid])
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_Person_AddContact]
	ON [Person].[Person] ([AdditionalContactInfo])
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_Person_Demographics]
	ON [Person].[Person] ([Demographics])
GO
SET ANSI_PADDING ON
GO
CREATE XML INDEX [XMLPATH_Person_Demographics]
	ON [Person].[Person] ([Demographics])
	USING XML INDEX [PXML_Person_Demographics]
	FOR PATH
GO
SET ANSI_PADDING ON
GO
CREATE XML INDEX [XMLPROPERTY_Person_Demographics]
	ON [Person].[Person] ([Demographics])
	USING XML INDEX [PXML_Person_Demographics]
	FOR PROPERTY
GO
SET ANSI_PADDING ON
GO
CREATE XML INDEX [XMLVALUE_Person_Demographics]
	ON [Person].[Person] ([Demographics])
	USING XML INDEX [PXML_Person_Demographics]
	FOR VALUE
GO
ALTER TABLE [Person].[Person] SET (LOCK_ESCALATION = TABLE)
GO
