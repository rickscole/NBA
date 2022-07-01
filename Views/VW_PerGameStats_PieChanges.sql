/****** Object:  View [NBA].[VW_PerGameStats_PieChanges]    Script Date: 7/1/2022 2:24:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [NBA].[VW_PerGameStats_PieChanges] as
with
normal as
(
	select
	Team
	, [Avg PPG Scored] = [Points per Game Scored]
	, [PPG Scored Average Pie] = [Points per Game Scored] / (select sum([Points per Game Scored]) from NBA.VW_PerGameStats)
	from NBA.VW_PerGameStats
),
past_month as
(
	select
	Team
	, [Recent PPG Scored] = avg(cast(Score as float))
	, [PPG Scored Recent Pie] = 
		avg(cast([Score] as float)) 
		/  
		(
			select sum_ppg = sum(ppg)
			from
			(
				select 
				team
				, ppg = avg(cast([Score] as float))
				from NBA.vw_teamscores 
				where 
				team not like '%Team%'
				and
				[Game Date] >= dateadd(month,-1,getdate())
				group by team
			)
			t0
		)
	from NBA.vw_teamscores
	where 
	team not like '%Team%'
	and [Game Date] >= dateadd(month,-1,getdate())
	group by Team
)
select 
n.Team
, n.[Avg PPG Scored]
, pm.[Recent PPG Scored]
, n.[PPG Scored Average Pie]
, pm.[PPG Scored Recent Pie]
, [PPG Scored Pie Change] = pm.[PPG Scored Recent Pie] - n.[PPG Scored Average Pie]
, [PPG Scored Ratio Pie Change] = pm.[PPG Scored Recent Pie] / n.[PPG Scored Average Pie] - 1
from normal n
inner join past_month pm
on n.team = pm.team
GO


