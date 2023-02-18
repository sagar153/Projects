USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[Organiser]    Script Date: 18-02-2023 23:52:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Organiser](
	[OrganiserId] [int] IDENTITY(1,1) NOT NULL,
	[OrganiserName] [varchar](100) NOT NULL,
	[FatherName] [varchar](100) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Area] [varchar](100) NOT NULL,
	[Village] [varchar](100) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Organiser] PRIMARY KEY CLUSTERED 
(
	[OrganiserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Organiser] ADD  CONSTRAINT [DF_Organiser_isActive]  DEFAULT ((1)) FOR [isActive]
GO


