USE [FactoryManagement]
GO

/****** Object:  Table [dbo].[User]    Script Date: 17-02-2023 10:43:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


