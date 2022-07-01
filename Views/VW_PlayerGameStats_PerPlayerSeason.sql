/****** Object:  View [NBA].[VW_PlayerGameStats_PerPlayerSeason]    Script Date: 7/1/2022 12:48:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE view [NBA].[VW_PlayerGameStats_PerPlayerSeason] as
with
team_season as
(
	select 
	[Total Plus Minus] = sum([Plus Minus])
	, [Total Team Minutes] = sum([Time Played (Minutes)])
	, [Plus Minus Per Team Minutes] = cast(sum([Plus Minus]) as float) / cast(sum([Time Played (Minutes)]) as float)
	, [Total Points] = sum([Points])
	, [Total Field Goals Made] = sum([Field Goals Made])
	, [Total Field Goals Attempted] = sum([Field Goals Attempted])
	, [Total Free Throws Made] = sum([Free Throws Made])
	, [Total Free Throws Attempted] = sum([Free Throws Attempted])
	, [Total Three Pointers Made] = sum([Three Pointers Made])
	, [Total Three Pointers Attempted] = sum([Three Pointers Attempted])
	, [Total Offensive Rebounds] = sum([Offensive Rebounds])
	, [Total Defensive Rebounds] = sum([Defensive Rebounds])
	, [Total Rebounds] = sum([Total Rebounds])
	, [Total Assists] = sum([Assists])
	, [Total Personal Fouls] = sum([Personal Fouls])
	, [Total Turnovers] = sum([Turnovers])
	, [Total Blocks] = sum([Blocks])
	, [Total Field Goal %] = case when sum([Field Goals Attempted]) = 0 then null else sum(cast([Field Goals Made] as float)) / sum(cast([Field Goals Attempted] as float)) end
	, [Total Free Throw %] = case when sum([Free Throws Attempted]) = 0 then null else sum(cast([Free Throws Made] as float)) / sum(cast([Free Throws Attempted] as float)) end
	, [Total Three Point %] = case when sum([Three Pointers Attempted]) = 0 then null else sum(cast([Three Pointers Made] as float)) / sum(cast([Three Pointers Attempted] as float)) end
	, [Season]
	, [Team Name]
	, [Team ID]
	from  [NBA].[VW_PlayerGameStats]
	where [Team Name] not in ('World World','USA USA','Team Team Durant','Team LeBron', 'Sydney Kings','Shanghai Sharks','Team Africa','Melbourne United','Haifa Maccabi Haifa','Guangzhou Long-Lions','Brisbane Bullets')
	group by 
	[Season]
	, [Team Name]
	, [Team ID]
),
player_team_season as
(
	select
	[Player ID]
	, [First Name]
	, [Last Name]
	, Player = concat([First Name],' ',[Last Name])
	, [Season]
	, [Team Name]
	, [Team ID]
	, [Player ID - Team ID - Season ID] = concat([Player ID] , ' | ' , [Team ID] , ' | ' ,  [Season])
	, [Number of Games] = count(*)
	, [Avg Points] = avg(cast([Points] as float))
	, [Avg Plus Minus] = avg(cast([Plus Minus] as float))
	, [Avg Field Goals Made] = avg(cast([Field Goals Made] as float))
	, [Avg Field Goals Attempted] = avg(cast([Field Goals Attempted] as float))
	, [Avg Offensive Rebounds] = avg(cast([Offensive Rebounds] as float))
	, [Avg Defensive Rebounds] = avg(cast([Defensive Rebounds] as float))
	, [Avg Total Rebounds] = avg(cast([Total Rebounds] as float))
	, [Avg Assists] = avg(cast([Assists] as float))
	, [Avg Personal Fouls] = avg(cast([Personal Fouls] as float))
	, [Avg Turnovers] = avg(cast([Turnovers] as float))
	, [Avg Blocks] = avg(cast([Blocks] as float))
	, [Avg Field Goal %] = case when sum([Field Goals Attempted]) = 0 then null else sum(cast([Field Goals Made] as float)) / sum(cast([Field Goals Attempted] as float)) end
	, [Avg Free Throw %] = case when sum([Free Throws Attempted]) = 0 then null else sum(cast([Free Throws Made] as float)) / sum(cast([Free Throws Attempted] as float)) end
	, [Avg Three Point %] = case when sum([Three Pointers Attempted]) = 0 then null else sum(cast([Three Pointers Made] as float)) / sum(cast([Three Pointers Attempted] as float)) end
	, [Time Played (Minutes)] = sum([Time Played (Minutes)])
	, [Total Plus Minus] = sum([Plus Minus])
	, [Total Minutes] = sum([Time Played (Minutes)])
	, [Plus Minus per Minute Played] = case when sum([Time Played (Minutes)]) = 0 then 0 else cast(sum([Plus Minus]) as float)/ cast(sum([Time Played (Minutes)]) as float) end
	from nba.vw_playergamestats
	where [Team Name] not in ('World World','USA USA','Team Team Durant','Team LeBron', 'Sydney Kings','Shanghai Sharks','Team Africa','Melbourne United','Haifa Maccabi Haifa','Guangzhou Long-Lions','Brisbane Bullets')
	and [Player ID] is not null
	group by 
	[Player ID]
	, [First Name]
	, [Last Name]
	, [Season]
	, [Team Name]
	, [Team ID]
)
select 
pts.*
, [Points per Minute] = cast([Total Points] as float) / cast([Time Played (Minutes)] as float)
, [Plus Minus per Minute] = cast(pts.[Total Plus Minus] as float) / cast([Time Played (Minutes)] as float)
, [Field Goals Made per Minute] = cast([Total Field Goals Made] as float) / cast([Time Played (Minutes)] as float)
, [Field Goals Attempted per Minute] = cast([Total Field Goals Attempted] as float) / cast([Time Played (Minutes)] as float)
, [Free Throws Made per Minute] = cast([Total Free Throws Made] as float) / cast([Time Played (Minutes)] as float)
, [Free Throws Attempted per Minute] = cast([Total Free Throws Attempted] as float) / cast([Time Played (Minutes)] as float)
, [Three Pointers Made per Minute] = cast([Total Three Pointers Made] as float) / cast([Time Played (Minutes)] as float)
, [Three Pointers Attempted per Minute] = cast([Total Three Pointers Attempted] as float) / cast([Time Played (Minutes)] as float)
, [Offensive Rebounds per Minute] = cast([Total Offensive Rebounds] as float) / cast([Time Played (Minutes)] as float)
, [Defensive Rebounds per Minute] = cast([Total Defensive Rebounds] as float) / cast([Time Played (Minutes)] as float)
, [Total Rebounds per Minute] = cast([Total Rebounds] as float) / cast([Time Played (Minutes)] as float)
, [Assists per Minute] = cast([Total Assists] as float) / cast([Time Played (Minutes)] as float)
, [Personal Fouls per Minute] = cast([Total Personal Fouls] as float) / cast([Time Played (Minutes)] as float)
, [Turnovers per Minute] = cast([Total Turnovers] as float) / cast([Time Played (Minutes)] as float)
, [Blocks per Minute] = cast([Total Blocks] as float) / cast([Time Played (Minutes)] as float)
, ts.[Plus Minus Per Team Minutes] 
, [Player Plus Minus Per Minute Above Team Average] = pts.[Plus Minus per Minute Played] - ts.[Plus Minus Per Team Minutes]
, [PAMPER] = (pts.[Plus Minus per Minute Played] - ts.[Plus Minus Per Team Minutes]) * cast(100 as float)
, [Player Added Points Per Game] = ( pts.[Plus Minus per Minute Played] - ts.[Plus Minus Per Team Minutes]) * 48
/*
, [Team % Improvement with Player] = -- case when ts.[Plus Minus Per Team Minutes] = 0 then 1 else  pts.[Plus Minus per Minute Played] /  ts.[Plus Minus Per Team Minutes] - 1 end
	(pts.[Plus Minus per Minute Played] - ts.[Plus Minus Per Team Minutes]) /(abs(
		case
			when ( pts.[Plus Minus per Minute Played] < 0 and ts.[Plus Minus Per Team Minutes] > 0 ) or ( pts.[Plus Minus per Minute Played] < 0 and ts.[Plus Minus Per Team Minutes] < 0 and pts.[Plus Minus per Minute Played] > ts.[Plus Minus Per Team Minutes] ) then pts.[Plus Minus per Minute Played]
			else ts.[Plus Minus Per Team Minutes]
		end)
	)
*/
from player_team_season pts
left join team_season ts
on pts.[team name] = ts.[team name]
and pts.[season] = ts.[season]
where [Time Played (Minutes)] != 0


GO


