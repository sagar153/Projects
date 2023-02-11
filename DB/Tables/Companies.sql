USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[Companies]    Script Date: 11-02-2023 14:50:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] NOT NULL,
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


