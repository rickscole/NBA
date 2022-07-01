/****** Object:  Table [STG].[TBL_Scores_NBA]    Script Date: 7/1/2022 12:10:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [STG].[TBL_Scores_NBA](
	[External ID] [nvarchar](100) NULL,
	[Season] [nvarchar](100) NULL,
	[Duration] [nvarchar](100) NULL,
	[Away Team] [nvarchar](100) NULL,
	[Home Team] [nvarchar](100) NULL,
	[Away Team Wins] [nvarchar](100) NULL,
	[Away Team Losses] [nvarchar](100) NULL,
	[Away Q1 Points] [nvarchar](100) NULL,
	[Away Q2 Points] [nvarchar](100) NULL,
	[Away Q3 Points] [nvarchar](100) NULL,
	[Away Q4 Points] [nvarchar](100) NULL,
	[Away Score] [nvarchar](100) NULL,
	[Home Team Wins] [nvarchar](100) NULL,
	[Home Team Losses] [nvarchar](100) NULL,
	[Home Q1 Points] [nvarchar](100) NULL,
	[Home Q2 Points] [nvarchar](100) NULL,
	[Home Q3 Points] [nvarchar](100) NULL,
	[Home Q4 Points] [nvarchar](100) NULL,
	[Home Score] [nvarchar](100) NULL,
	[Officials] [nvarchar](1000) NULL,
	[Times Tied] [nvarchar](100) NULL,
	[Lead Changes] [nvarchar](100) NULL,
	[Game Date] [nvarchar](100) NULL
) ON [PRIMARY]
GO


