/****** Object:  Table [NBA].[TBL_PlayerGameStats]    Script Date: 7/1/2022 12:38:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [NBA].[TBL_PlayerGameStats](
	[PK_ID_PlayerGame] [int] IDENTITY(1,1) NOT NULL,
	[TS_PlayerGame] [datetime2](7) NULL,
	[Player ID] [int] NULL,
	[First Name] [nvarchar](100) NULL,
	[Last Name] [nvarchar](100) NULL,
	[Team ID] [int] NULL,
	[Team Name] [nvarchar](100) NULL,
	[Game ID] [int] NULL,
	[Points] [smallint] NULL,
	[Position] [nvarchar](100) NULL,
	[Minutes] [nvarchar](100) NULL,
	[Field Goals Made] [tinyint] NULL,
	[Field Goals Attempted] [tinyint] NULL,
	[Free Throws Made] [tinyint] NULL,
	[Free Throws Attempted] [tinyint] NULL,
	[Three Pointers Made] [tinyint] NULL,
	[Three Pointers Attempted] [tinyint] NULL,
	[Offensive Rebounds] [tinyint] NULL,
	[Defensive Rebounds] [tinyint] NULL,
	[Assists] [tinyint] NULL,
	[Personal Fouls] [tinyint] NULL,
	[Turnovers] [tinyint] NULL,
	[Blocks] [tinyint] NULL,
	[Plus Minus] [smallint] NULL,
	[Comment] [nvarchar](100) NULL,
	[Season] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_PlayerGame] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


