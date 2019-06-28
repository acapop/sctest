SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[PhoneNumberType] (
		[PhoneNumberTypeID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]                  [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_PhoneNumberType_PhoneNumberTypeID]
		PRIMARY KEY
		CLUSTERED
		([PhoneNumberTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[PhoneNumberType] SET (LOCK_ESCALATION = TABLE)
GO
