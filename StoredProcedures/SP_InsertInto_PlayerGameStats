/****** Object:  StoredProcedure [NBA].[SP_InsertInto_PlayerGameStats]    Script Date: 7/1/2022 12:33:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [NBA].[SP_InsertInto_PlayerGameStats] as

insert into NBA.TBL_PlayerGameStats
SELECT 
sysdatetime()
, [Player ID] = try_convert(int,[Player ID])
, [First Name]
, [Last Name]
, [Team ID] = try_convert(int,[Team ID])
, [Team Name]
, [Game ID] = try_convert(int,[Game ID])
, [Points] = try_convert(smallint,[Points])
, [Position]
, [Minutes]
, [Field Goals Made] = try_convert(tinyint,[Field Goals Made])
, [Field Goals Attempted] = try_convert(tinyint,[Field Goals Attempted])
, [Free Throws Made] = try_convert(tinyint,[Free Throws Made])
, [Free Throws Attempted] = try_convert(tinyint,[Free Throws Attempted])
, [Three Pointers Made] = try_convert(tinyint,[Three Pointers Made])
, [Three Pointers Attempted] = try_convert(tinyint,[Three Pointers Attempted])
, [Offensive Rebounds] = try_convert(tinyint,[Offensive Rebounds])
, [Defensive Rebounds] = try_convert(tinyint,[Defensive Rebounds])
, [Assists] = try_convert(tinyint,[Assists])
, [Personal Fouls] = try_convert(tinyint,[Personal Fouls])
, [Turnovers] = try_convert(tinyint,[Turnovers])
, [Blocks] = try_convert(tinyint,[Blocks])
, [Plus Minus] = try_convert(smallint,[Plus Minus])
, [Comment]
, [Season] = try_convert(smallint,[Season])
FROM [STG].[TBL_PlayerGameStats_NBA]

delete from [STG].[TBL_PlayerGameStats_NBA]
GO


