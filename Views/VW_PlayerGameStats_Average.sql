/****** Object:  View [NBA].[VW_PlayerGameStats_Average]    Script Date: 7/1/2022 2:33:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [NBA].[VW_PlayerGameStats_Average] as
select
[Player ID]
, [Player]
, [Season]
--
, [Avg Points Per Minute] = avg([Points per Minute])
, [Avg Plus Minus Per Minute] = avg([Plus Minus per Minute])
, [Avg Field Goals Made per Minute] = avg([Field Goals Made per Minute])
, [Avg Field Goals Attempted per Minute] = avg([Field Goals Attempted per Minute])
, [Avg Free Throws Made per Minute] = avg([Free Throws Made per Minute])
, [Avg Free Throws Attempted per Minute] = avg([Free Throws Attempted per Minute])
, [Avg Three Pointers Made per Minute] = avg([Three Pointers Made per Minute])
, [Avg Three Pointers Attempted per Minute] = avg([Three Pointers Attempted per Minute])
, [Avg Offensive Rebounds per Minute] = avg([Offensive Rebounds per Minute])
, [Avg Defensive Rebounds per Minute] = avg([Defensive Rebounds per Minute])
, [Avg Total Rebounds per Minute] = avg([Total Rebounds per Minute])
, [Avg Assists per Minute] = avg([Assists per Minute])
, [Avg Personal Fouls per Minute] = avg([Personal Fouls per Minute])
, [Avg Turnovers per Minute] = avg([Turnovers per Minute])
, [Avg Blocks per Minute] = avg([Blocks per Minute])
-- 
, [Avg Points] = avg([Points])
, [Avg Plus Minus] = avg([Plus Minus])
, [Avg Field Goals Made] = avg([Field Goals Made])
, [Avg Field Goals Attempted] = avg([Field Goals Attempted])
, [Avg Field Goal %] = case when sum([Field Goals Attempted]) = 0 then 0 else sum([Field Goals Made]) / sum([Field Goals Attempted]) end
, [Avg Free Throws Made] = avg([Free Throws Made])
, [Avg Free Throws Attempted] = avg([Free Throws Attempted])
, [Avg Free Throw %] = case when sum([Free Throws Attempted]) = 0 then 0 else sum([Free Throws Made]) / sum([Free Throws Attempted]) end
, [Avg Three Pointers Made] = avg([Three Pointers Made])
, [Avg Three Pointers Attempted] = avg([Three Pointers Attempted])
, [Avg Three Pointer %] = case when sum([Three Pointers Attempted]) = 0 then 0 else sum([Three Pointers Made]) / sum([Three Pointers Attempted]) end
, [Avg Offensive Rebounds] = avg([Offensive Rebounds])
, [Avg Defensive Rebounds] = avg([Defensive Rebounds])
, [Avg Total Rebounds] = avg([Total Rebounds])
, [Avg Assists] = avg([Assists])
, [Avg Personal Fouls] = avg([Personal Fouls])
, [Avg Turnovers] = avg([Turnovers])
, [Avg Blocks] = avg([Blocks])
, [Time Played (Minutes)] = sum([Time Played (Minutes)])
from nba.vw_playergametimeseries 
where season = 2021
group by 
[Player ID]
, [Player]
, [Season]
GO


