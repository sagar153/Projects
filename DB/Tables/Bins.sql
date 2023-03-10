USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[Bins]    Script Date: 12-02-2023 22:46:34 ******/
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


