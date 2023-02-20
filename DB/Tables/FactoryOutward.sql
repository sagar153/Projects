USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[FactoryOutward]    Script Date: 20-02-2023 19:13:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


