USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[OrganiserAdvance]    Script Date: 19-02-2023 01:27:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrganiserAdvance](
	[OrganiserAdvanceId] [int] IDENTITY(1,1) NOT NULL,
	[OrganiserId] [int] NOT NULL,
	[Year] [varchar](20) NULL,
	[Advance] [decimal](18, 2) NULL,
	[AdvanceDate] [datetime] NULL,
	[Mode] [varchar](200) NULL,
	[Remarks] [varchar](1000) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_OrganiserAdvance] PRIMARY KEY CLUSTERED 
(
	[OrganiserAdvanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrganiserAdvance] ADD  CONSTRAINT [DF_OrganiserAdvance_isActive]  DEFAULT ((1)) FOR [isActive]
GO


