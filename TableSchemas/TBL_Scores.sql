/****** Object:  Table [NBA].[TBL_Scores]    Script Date: 7/1/2022 12:39:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [NBA].[TBL_Scores](
	[PK_ID_Scores] [int] IDENTITY(1,1) NOT NULL,
	[TS_Scores] [datetime2](7) NULL,
	[External ID] [int] NULL,
	[Season] [int] NULL,
	[Duration] [nvarchar](10) NULL,
	[Away Team] [nvarchar](100) NULL,
	[Home Team] [nvarchar](100) NULL,
	[Away Team Wins] [tinyint] NULL,
	[Away Team Losses] [tinyint] NULL,
	[Away Q1 Points] [tinyint] NULL,
	[Away Q2 Points] [tinyint] NULL,
	[Away Q3 Points] [tinyint] NULL,
	[Away Q4 Points] [tinyint] NULL,
	[Away Score] [smallint] NULL,
	[Home Team Wins] [tinyint] NULL,
	[Home Team Losses] [tinyint] NULL,
	[Home Q1 Points] [tinyint] NULL,
	[Home Q2 Points] [tinyint] NULL,
	[Home Q3 Points] [tinyint] NULL,
	[Home Q4 Points] [tinyint] NULL,
	[Home Score] [smallint] NULL,
	[Officials] [nvarchar](1000) NULL,
	[Times Tied] [tinyint] NULL,
	[Lead Changes] [tinyint] NULL,
	[Game Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Scores] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


