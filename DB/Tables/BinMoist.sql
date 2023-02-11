USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[BinMoist]    Script Date: 11-02-2023 14:49:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BinMoist](
	[BinDailyMoistId] [int] NOT NULL,
	[BinId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Variety] [varchar](100) NOT NULL,
	[MorningUpMoist] [decimal](18, 2) NULL,
	[MorningDownMoist] [decimal](18, 2) NULL,
	[EvnUpmoist] [decimal](18, 2) NULL,
	[EvnDownMoist] [decimal](18, 2) NULL,
	[Shelling] [bit] NULL,
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


