USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[FactoryIntake]    Script Date: 12-02-2023 22:47:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	[DateAdded] [DateTime],
	[DateModified] [DateTime]
 CONSTRAINT [PK_CompanyIntake] PRIMARY KEY CLUSTERED 
(
	[FactoryIntakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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


