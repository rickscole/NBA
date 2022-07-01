/****** Object:  View [NBA].[VW_PlayerGameTimeSeries]    Script Date: 7/1/2022 12:49:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--select
--[First Name]
--, [Last Name]
--, [Points]
--, [Plus Minus]
--, [Points per Minute] = cast(Points as float) / cast([Time Played (Minutes)] as float)
--, [Plus Minus per Minute] = cast([Plus Minus] as float) / cast([Time Played (Minutes)] as float)
--from [NBA].[VW_PlayerGameStats]
--where [Player ID] = 2801
--and Season = 2021
--and [Time Played (Minutes)] is not null
--and [Time Played (Minutes)] != 0
--order by [Game ID] asc


CREATE view [NBA].[VW_PlayerGameTimeSeries] as
with t0 as
(
	select
	[ID Player-Season-Game] = row_number() over(partition by [Player ID], pgs.[Season] order by [Game ID])
	, [ID Player-Game] = row_number() over(partition by [Player ID] order by pgs.[Season], [Game ID])
	, [Player ID]
	, Player = concat([First Name],' ',[Last Name])
	, [First Name]
	, [Last Name]
	, [Team ID]
	, [Team Name]
	, [Position]
	, [Points] = cast([Points] as float)
	, [Field Goals Made] = cast([Field Goals Made] as float)
	, [Field Goals Attempted] = cast([Field Goals Attempted] as float)
	, [Field Goal %] = case when [Field Goals Attempted] = 0 then 0 else cast([Field Goals Made] as float) / cast([Field Goals Attempted] as float) end
	, [Free Throws Made] = cast([Free Throws Made] as float)
	, [Free Throws Attempted] = cast([Free Throws Attempted] as float)
	, [Free Throw %] = case when [Free Throws Attempted] = 0 then 0 else cast([Free Throws Made] as float) / cast([Free Throws Attempted] as float) end
	, [Three Pointers Made] = cast([Three Pointers Made] as float)
	, [Three Pointers Attempted] = cast([Three Pointers Attempted] as float)
	, [Three Pointers %] = case when [Three Pointers Attempted] = 0 then 0 else cast([Three Pointers Made] as float) / cast([Three Pointers Attempted] as float) end
	, [Offensive Rebounds] = cast([Offensive Rebounds] as float)
	, [Defensive Rebounds] = cast([Defensive Rebounds] as float)
	, [Total Rebounds] = cast([Total Rebounds] as float)
	, [Assists] = cast([Assists] as float)
	, [Personal Fouls] = cast([Personal Fouls] as float)
	, [Turnovers] = cast([Turnovers] as float)
	, [Blocks] = cast([Blocks] as float)
	, [Plus Minus] = cast([Plus Minus] as float)
	, pgs.[Season]
	, s.[Game Date]
	, [Points per Minute] = cast(Points as float) / cast([Time Played (Minutes)] as float)
	, [Plus Minus per Minute] = cast([Plus Minus] as float) / cast([Time Played (Minutes)] as float)
	, [Field Goals Made per Minute] = cast([Field Goals Made] as float) / cast([Time Played (Minutes)] as float)
	, [Field Goals Attempted per Minute] = cast([Field Goals Attempted] as float) / cast([Time Played (Minutes)] as float)
	, [Free Throws Made per Minute] = cast([Free Throws Made] as float) / cast([Time Played (Minutes)] as float)
	, [Free Throws Attempted per Minute] = cast([Free Throws Attempted] as float) / cast([Time Played (Minutes)] as float)
	, [Three Pointers Made per Minute] = cast([Three Pointers Made] as float) / cast([Time Played (Minutes)] as float)
	, [Three Pointers Attempted per Minute] = cast([Three Pointers Attempted] as float) / cast([Time Played (Minutes)] as float)
	, [Offensive Rebounds per Minute] = cast([Offensive Rebounds] as float) / cast([Time Played (Minutes)] as float)
	, [Defensive Rebounds per Minute] = cast([Defensive Rebounds] as float) / cast([Time Played (Minutes)] as float)
	, [Total Rebounds per Minute] = cast([Total Rebounds] as float) / cast([Time Played (Minutes)] as float)
	, [Assists per Minute] = cast([Assists] as float) / cast([Time Played (Minutes)] as float)
	, [Personal Fouls per Minute] = cast([Personal Fouls] as float) / cast([Time Played (Minutes)] as float)
	, [Turnovers per Minute] = cast([Turnovers] as float) / cast([Time Played (Minutes)] as float)
	, [Blocks per Minute] = cast([Blocks] as float) / cast([Time Played (Minutes)] as float)
	, [Time Played (Minutes)]
	from [NBA].[VW_PlayerGameStats] pgs
	left join nba.tbl_scores s
	on pgs.[Game ID] = s.[External ID]
	where 
	1 = 1 
	-- and [Player ID] = 2858
	-- and Season = 2021
	and [Player ID] is not null
	and [Time Played (Minutes)] is not null
	and [Time Played (Minutes)] != 0
	and [Team Name] not in ('World World','USA USA','Team Team Durant','Team LeBron', 'Sydney Kings','Shanghai Sharks','Team Africa','Melbourne United','Haifa Maccabi Haifa','Guangzhou Long-Lions','Brisbane Bullets')
)
select 
*
, [Points (SMA 5)] = avg([Points]) over(order by [ID Player-Season-Game] rows between 4 preceding and current row )
, [Points (SMA 10)] = avg([Points]) over(order by [ID Player-Season-Game] rows between 9 preceding and current row )
, [Plus Minus (SMA 5)] = avg([Plus Minus]) over(order by [ID Player-Season-Game] rows between 4 preceding and current row )
, [Plus Minus (SMA 10)] = avg([Plus Minus]) over(order by [ID Player-Season-Game] rows between 9 preceding and current row )
, [Points per Minute (SMA 5)] = avg([Points per Minute]) over(order by [ID Player-Season-Game] rows between 4 preceding and current row )
, [Points per Minute (SMA 10)] = avg([Points per Minute]) over(order by [ID Player-Season-Game] rows between 9 preceding and current row )
, [Plus Minus per Minute (SMA 5)] = avg([Plus Minus per Minute]) over(order by [ID Player-Season-Game] rows between 4 preceding and current row )
, [Plus Minus per Minute (SMA 10)] = avg([Plus Minus per Minute]) over(order by [ID Player-Season-Game] rows between 9 preceding and current row )
from t0


GO


