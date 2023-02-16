USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[FactoryOutward]    Script Date: 12-02-2023 22:47:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactoryOutward](
	[FactoryOutWardId] [int] IDENTITY(1,1) NOT NULL,
	[FactoryInTakeId] [int] NOT NULL,
	[DCNo] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[ShowingDate] [datetime] NULL,
	[ShowingMoist] [decimal](18, 2) NULL,
	[Hours] [int] NULL,
	[isActive] [bit] NOT NULL,
	[DateAdded] [datetime],
	[DateModified] [datetime]
 CONSTRAINT [PK_CompanyOutward] PRIMARY KEY CLUSTERED 
(
	[FactoryOutWardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactoryOutward] ADD  CONSTRAINT [DF_CompanyOutward_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[FactoryOutward]  WITH CHECK ADD  CONSTRAINT [FK_FactoryOutward_FactoryIntake] FOREIGN KEY([FactoryInTakeId])
REFERENCES [dbo].[FactoryIntake] ([FactoryIntakeId])
GO

ALTER TABLE [dbo].[FactoryOutward] CHECK CONSTRAINT [FK_FactoryOutward_FactoryIntake]
GO


