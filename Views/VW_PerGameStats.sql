/****** Object:  View [NBA].[VW_PerGameStats]    Script Date: 7/1/2022 2:23:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE view [NBA].[VW_PerGameStats] as
select 
[Team]
, [Points per Game Scored] = avg(cast([Score] as decimal(12,8)))
, [STDEV Points per Game] = stdev(cast([Score] as decimal(12,8)))
from NBA.VW_TeamScores
where 
Team not like '%Team%'
and Season = (select max(season) from NBA.VW_TeamScores)
group by [Team]

GO


