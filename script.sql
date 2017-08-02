USE [TravelBlog]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 8/1/2017 11:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TripId] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 8/1/2017 11:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[TripId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Trips] PRIMARY KEY CLUSTERED 
(
	[TripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [Name], [TripId]) VALUES (1, N'Dutch Harbor', 1)
INSERT [dbo].[Locations] ([LocationId], [Name], [TripId]) VALUES (2, N'Mexico City', 2)
INSERT [dbo].[Locations] ([LocationId], [Name], [TripId]) VALUES (3, N'Chichen Itza', 2)
INSERT [dbo].[Locations] ([LocationId], [Name], [TripId]) VALUES (4, N'Venice', 3)
INSERT [dbo].[Locations] ([LocationId], [Name], [TripId]) VALUES (5, N'Florence', 3)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([TripId], [Name]) VALUES (1, N'Alaska')
INSERT [dbo].[Trips] ([TripId], [Name]) VALUES (2, N'Mexico')
INSERT [dbo].[Trips] ([TripId], [Name]) VALUES (3, N'Italy')
INSERT [dbo].[Trips] ([TripId], [Name]) VALUES (5, N'Fire Fighting')
SET IDENTITY_INSERT [dbo].[Trips] OFF
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Locations]
GO
ALTER TABLE [dbo].[Locations]  WITH NOCHECK ADD  CONSTRAINT [FK_Locations_Trips] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([TripId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Trips]
GO
