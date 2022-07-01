/****** Object:  View [NBA].[VW_PlayerGameTeamStats_PerPlayerSeason_Percent]    Script Date: 7/1/2022 2:41:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



  





CREATE view [NBA].[VW_PlayerGameTeamStats_PerPlayerSeason_Percent] as


-- NOTES:
-- 202206151405
-- needed to generate link in Power BI

with 
base as
(
	select *
	from NBA.TBL_PlayerGameTeamStats_PerPlayerSeason_Percent
), 
t0 as
(
	select			 [Player ID],[Player],[Season],[Team ID],[Group],[Metric] = 'Percent Points Per Minute'			   ,[Value] = [Percent Points Per Minute]								from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Plus Minus Per Minute'               ,[Percent Plus Minus Per Minute]						from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Field Goals Made Per Minute'         ,[Percent Field Goals Made Per Minute]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Field Goals Attempted Per Minute'    ,[Percent Field Goals Attempted Per Minute]			from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Free Throws Made Per Minute'           ,[Percent Free Throws Made Per Game]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Free Throws Attempted Per Minute'      ,[Percent Free Throws Attempted Per Game]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Three Pointers Made Per Minute'        ,[Percent Three Pointers Made Per Minute]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Three Pointers Attempted Per Minute'   ,[Percent Three Pointers Attempted Per Minute]			from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Offensive Rebounds Per Minute'       ,[Percent Offensive Rebounds Per Minute]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Defensive Rebounds Per Minute'       ,[Percent Defensive Rebounds Per Minute]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Total Rebounds Per Minute'           ,[Percent Total Rebounds Per Minute]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Assists Per Minute'                  ,[Percent Assists Per Minute]							from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Personal Fouls Per Minute'           ,[Percent Personal Fouls Per Minute]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Turnovers Per Minute'                ,[Percent Turnovers Per Minute]						from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Blocks Per Minute'                   ,[Percent Blocks Per Minute]							from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Points Per Game'                     ,[Percent Points Per Game]								from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Plus Minus Per Game'                 ,[Percent Plus Minus Per Game]							from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Field Goals Made Per Game'           ,[Percent Field Goals Made Per Game]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Field Goals Attempted Per Game'      ,[Percent Field Goals Attempted Per Game]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Field Goal %'                        ,[Percent Field Goal %]								from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Free Throws Made Per Game'           ,[Percent Free Throws Made Per Game]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Free Throws Attempted Per Game'      ,[Percent Free Throws Attempted Per Game]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Free Throw %'                        ,[Percent Free Throw %]								from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Three Pointers Made Per Game'        ,[Percent Three Pointers Made Per Game]				from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Three Pointers Attempted Per Game'   ,[Percent Three Pointers Attempted Per Game]			from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Three Pointer %'                     ,[Percent Three Pointer %]								from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Offensive Rebounds Per Game'         ,[Percent Offensive Rebounds Per Game]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Defensive Rebounds Per Game'         ,[Percent Defensive Rebounds Per Game]					from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Total Rebounds Per Game'             ,[Percent Total Rebounds Per Game]						from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Assists Per Game'                    ,[Percent Assists Per Game]							from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Personal Fouls Per Game'             ,[Percent Personal Fouls Per Game]						from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Turnovers Per Game'                  ,[Percent Turnovers Per Game]							from base
	union all select [Player ID],[Player],[Season],[Team ID],[Group],'Percent Blocks Per Game'                     ,[Percent Blocks Per Game]								from base
)
select
[ID PlayerID - Season - Group - Metric] = concat([Player ID],' | ',[Season],' | ',[Group],' | ',replace([Metric],'Percent ','')) -- 202206151405
, t.[Team Name]
, t0.*
from t0
left join [NBA].[VW_Teams] t
on t0.[Team ID] = t.[Team ID]
GO


