USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[Bins]    Script Date: 23-02-2023 14:33:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bins](
	[BinId] [int] IDENTITY(1,1) NOT NULL,
	[BinName] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Bins] PRIMARY KEY CLUSTERED 
(
	[BinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Bins] ADD  CONSTRAINT [DF_Bins_isActive]  DEFAULT ((1)) FOR [isActive]
GO


CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_isActive]  DEFAULT ((1)) FOR [isActive]
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

CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Admin] [bit] NOT NULL,
	[User] [bit] NOT NULL,
	[Full] [bit] NOT NULL,
	[FactoryOnly] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Admin]  DEFAULT ((0)) FOR [Admin]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User]  DEFAULT ((0)) FOR [User]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Full]  DEFAULT ((0)) FOR [Full]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_FactoryOnly]  DEFAULT ((0)) FOR [FactoryOnly]
GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((1)) FOR [isActive]
GO

CREATE TABLE [dbo].[BinMoist](
	[BinDailyMoistId] [int] IDENTITY(1,1) NOT NULL,
	[BinId] [int] NOT NULL,
	[Year] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Variety] [varchar](100) NOT NULL,
	[MorningUpMoist] [decimal](18, 2) NULL,
	[MorningDownMoist] [decimal](18, 2) NULL,
	[EvnUpmoist] [decimal](18, 2) NULL,
	[EvnDownMoist] [decimal](18, 2) NULL,
	[Shelling] [bit] NULL,
	[ShellingDate] [datetime] NULL,
	[Lot] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_BinMoist] PRIMARY KEY CLUSTERED 
(
	[BinDailyMoistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BinMoist] ADD  CONSTRAINT [DF_BinMoist_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[BinMoist]  WITH CHECK ADD  CONSTRAINT [FK_BinMoist_Bins] FOREIGN KEY([BinId])
REFERENCES [dbo].[Bins] ([BinId])
GO

ALTER TABLE [dbo].[BinMoist] CHECK CONSTRAINT [FK_BinMoist_Bins]
GO

ALTER TABLE [dbo].[BinMoist]  WITH CHECK ADD  CONSTRAINT [FK_BinMoist_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO

ALTER TABLE [dbo].[BinMoist] CHECK CONSTRAINT [FK_BinMoist_Companies]
GO

CREATE TABLE [dbo].[FactoryIntake](
	[FactoryIntakeId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Year] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[LorryNo] [varchar](50) NOT NULL,
	[Variety] [varchar](50) NOT NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[Moist] [decimal](18, 2) NULL,
	[Bags] [int] NOT NULL,
	[Lot] [int] NOT NULL,
	[Executive] [varchar](100) NULL,
	[BinId] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[isActive] [bit] NOT NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_CompanyIntake] PRIMARY KEY CLUSTERED 
(
	[FactoryIntakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactoryIntake] ADD  CONSTRAINT [DF_FactoryIntake_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[FactoryIntake]  WITH CHECK ADD  CONSTRAINT [FK_FactoryIntake_Bins] FOREIGN KEY([BinId])
REFERENCES [dbo].[Bins] ([BinId])
GO

ALTER TABLE [dbo].[FactoryIntake] CHECK CONSTRAINT [FK_FactoryIntake_Bins]
GO

ALTER TABLE [dbo].[FactoryIntake]  WITH CHECK ADD  CONSTRAINT [FK_FactoryIntake_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO

ALTER TABLE [dbo].[FactoryIntake] CHECK CONSTRAINT [FK_FactoryIntake_Companies]
GO

CREATE TABLE [dbo].[FactoryOutward](
	[FactoryOutWardId] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[CompanyId] [int] NOT NULL,
	[Variety] [nchar](50) NULL,
	[LorryNo] [varchar](50) NOT NULL,
	[Weight] [decimal](18, 2) NULL,
	[Bags] [int] NULL,
	[DCNo] [varchar](50) NULL,
	[CompanyExecutive] [varchar](100) NULL,
	[Remarks] [varchar](1000) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyOutward] PRIMARY KEY CLUSTERED 
(
	[FactoryOutWardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactoryOutward] ADD  CONSTRAINT [DF_CompanyOutward_isActive]  DEFAULT ((1)) FOR [isActive]
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

CREATE TABLE [dbo].[OrganiserHoldings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrganiserId] [int] NOT NULL,
	[Variety] [nvarchar](500) NOT NULL,
	[Area] [nvarchar](100) NOT NULL,
	[ACRES] [decimal](18, 2) NOT NULL,
	[PacketsMale] [nvarchar](100) NULL,
	[PacketsFemale] [nvarchar](100) NULL,
	[ActaulTonnage] [decimal](18, 2) NULL,
	[RemainingTonnage] [decimal](18, 2) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_OrganiserHoldings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrganiserHoldings] ADD  CONSTRAINT [DF_OrganiserHoldings_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[OrganiserHoldings]  WITH CHECK ADD  CONSTRAINT [FK_OrganiserHoldings_Organiser] FOREIGN KEY([OrganiserId])
REFERENCES [dbo].[Organiser] ([OrganiserId])
GO

ALTER TABLE [dbo].[OrganiserHoldings] CHECK CONSTRAINT [FK_OrganiserHoldings_Organiser]
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

