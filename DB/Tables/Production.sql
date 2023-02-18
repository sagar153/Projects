USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[Production]    Script Date: 19-02-2023 00:00:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Production](
	[ProductionId] [int] IDENTITY(1,1) NOT NULL,
	[Year] [nvarchar](50) NOT NULL,
	[OrganiserId] [int] NOT NULL,
	[FarmerName] [nvarchar](100) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[FatherName] [varchar](100) NOT NULL,
	[ACRES] [decimal](18, 2) NOT NULL,
	[Variety] [nvarchar](50) NOT NULL,
	[SurveyNo] [nvarchar](50) NOT NULL,
	[Village] [nvarchar](100) NOT NULL,
	[Area] [nvarchar](100) NOT NULL,
	[ShowingDate] [datetime] NULL,
	[HarvestDate] [datetime] NULL,
	[TotalTonnage] [decimal](18, 2) NULL,
	[AddDate] [datetime] NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[ProductionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_Organiser] FOREIGN KEY([OrganiserId])
REFERENCES [dbo].[Organiser] ([OrganiserId])
GO

ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_Organiser]
GO


