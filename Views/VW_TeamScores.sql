/****** Object:  View [NBA].[VW_TeamScores]    Script Date: 7/1/2022 2:21:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [NBA].[VW_TeamScores] as
select
[Season] 
, [Duration]
, [Hours] = try_convert(tinyint,left([Duration],1))
, [Minutes] = try_convert(tinyint,right(Duration,2))
, [Duration (Hours)] = cast(try_convert(tinyint,left([Duration],1)) as float) + cast(try_convert(tinyint,right(Duration,2)) as float) / 60
, [Duration (Minutes)] = cast(try_convert(tinyint,left([Duration],1)) as float) * 60 + cast(try_convert(tinyint,right(Duration,2)) as float) 
, [Team] = [Away Team] 
, [Score] = [Away Score]
, [Wins] = [Away Team Wins]
, [Losses] = [Away Team Losses]
, [Win / Loss Ratio] = case when [Away Team Losses] = 0 then 1 else cast([Away Team Wins] as float) / cast([Away Team Losses] as float) end
, [Q1 Points] = [Away Q1 Points]
, [Q2 Points] = [Away Q2 Points]
, [Q3 Points] = [Away Q3 Points]
, [Q4 Points] = [Away Q4 Points]
, [Overtime Points] = [Away Score] - ([Away Q1 Points] + [Away Q2 Points] + [Away Q3 Points] + [Away Q4 Points])
, [Q1 %] = cast([Away Q1 Points] as float) / cast([Away Score] as float)
, [Q2 %] = cast([Away Q2 Points] as float) / cast([Away Score] as float)
, [Q3 %] = cast([Away Q3 Points] as float) / cast([Away Score] as float)
, [Q4 %] = cast([Away Q4 Points] as float) / cast([Away Score] as float)
, [Overtime %] = cast(([Away Score] - ([Away Q1 Points] + [Away Q2 Points] + [Away Q3 Points] + [Away Q4 Points]))  as float)/ cast([Away Score] as float)
, [Half 1 %] = cast([Away Q1 Points] + [Away Q2 Points] as float) / cast([Away Score] as float)
, [Half 2 %] = cast([Away Q3 Points] + [Away Q4 Points] as float) / cast([Away Score] as float)
, [Q1 % of Half]  = cast([Away Q1 Points] as float) / cast([Away Q1 Points] + [Away Q2 Points] as float)
, [Q2 % of Half] = cast([Away Q2 Points] as float) / cast([Away Q1 Points] + [Away Q2 Points] as float)
, [Q3 % of Half] = cast([Away Q3 Points] as float) / cast([Away Q3 Points] + [Away Q4 Points] as float)
, [Q4 % of Half] = cast([Away Q4 Points] as float) / cast([Away Q3 Points] + [Away Q4 Points] as float)
, [Officials]
, [Times Tied]
, [Lead Changes]
, [Home or Away] = 'Away'
, [Game Date] = dateadd(day,-1,[Game Date])
from [Grant].nba.[TBL_Scores]

union all 

select
[Season] 
, [Duration]
, [Hours] = try_convert(tinyint,left([Duration],1))
, [Minutes] = try_convert(tinyint,right(Duration,2))
, [Duration (Hours)] = cast(try_convert(tinyint,left([Duration],1)) as float) + cast(try_convert(tinyint,right(Duration,2)) as float) / 60
, [Duration (Minutes)] = cast(try_convert(tinyint,left([Duration],1)) as float) * 60 + cast(try_convert(tinyint,right(Duration,2)) as float) 
, [Team] = [Home Team] 
, [Score] = [Home Score]
, [Wins] = [Home Team Wins]
, [Losses] = [Home Team Losses]
, [Win / Loss Ratio] = case when [Home Team Losses] = 0 then 1 else cast([Home Team Wins] as float) / cast([Home Team Losses] as float) end
, [Q1 Points] = [Home Q1 Points]
, [Q2 Points] = [Home Q2 Points]
, [Q3 Points] = [Home Q3 Points]
, [Q4 Points] = [Home Q4 Points]
, [Overtime Points] = [Home Score] - ([Home Q1 Points] + [Home Q2 Points] + [Home Q3 Points] + [Home Q4 Points])
, [Q1 %] = cast([Home Q1 Points] as float) / cast([Home Score] as float)
, [Q2 %] = cast([Home Q2 Points] as float) / cast([Home Score] as float)
, [Q3 %] = cast([Home Q3 Points] as float) / cast([Home Score] as float)
, [Q4 %] = cast([Home Q4 Points] as float) / cast([Home Score] as float)
, [Overtime %] = cast(([Home Score] - ([Home Q1 Points] + [Home Q2 Points] + [Home Q3 Points] + [Home Q4 Points]))  as float)/ cast([Home Score] as float)
, [Half 1 %] = cast([Home Q1 Points] + [Home Q2 Points] as float) / cast([Home Score] as float)
, [Half 2 %] = cast([Home Q3 Points] + [Home Q4 Points] as float) / cast([Home Score] as float)
, [Q1 % of Half]  = cast([Home Q1 Points] as float) / cast([Home Q1 Points] + [Home Q2 Points] as float)
, [Q2 % of Half] = cast([Home Q2 Points] as float) / cast([Home Q1 Points] + [Home Q2 Points] as float)
, [Q3 % of Half] = cast([Home Q3 Points] as float) / cast([Home Q3 Points] + [Home Q4 Points] as float)
, [Q4 % of Half] = cast([Home Q4 Points] as float) / cast([Home Q3 Points] + [Home Q4 Points] as float)
, [Officials]
, [Times Tied]
, [Lead Changes]
, [Home or Away] = 'Home'
, [Game Date] = dateadd(day,-1,[Game Date])
from [Grant].nba.[TBL_Scores]



GO


