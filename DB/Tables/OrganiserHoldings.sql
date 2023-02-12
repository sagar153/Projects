USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[OrganiserHoldings]    Script Date: 12-02-2023 22:47:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


