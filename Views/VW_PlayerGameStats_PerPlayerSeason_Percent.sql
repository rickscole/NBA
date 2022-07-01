/****** Object:  View [NBA].[VW_PlayerGameStats_PerPlayerSeason_Percent]    Script Date: 7/1/2022 2:45:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- NOTES:
-- 202206151405
-- needed to generate link in Power BI


CREATE view [NBA].[VW_PlayerGameStats_PerPlayerSeason_Percent] as
/*
select			 [Player ID],[Player],[Season],[Group],[Metric] = 'Avg Points Per Minute'			   ,[Value] = [Avg Points Per Minute]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Plus Minus Per Minute'                   ,[Avg Plus Minus Per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Field Goals Made per Minute'             ,[Avg Field Goals Made per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Field Goals Attempted per Minute'        ,[Avg Field Goals Attempted per Minute]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Offensive Rebounds per Minute'           ,[Avg Offensive Rebounds per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Defensive Rebounds per Minute'           ,[Avg Defensive Rebounds per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Total Rebounds per Minute'               ,[Avg Total Rebounds per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Assists per Minute'                      ,[Avg Assists per Minute]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Personal Fouls per Minute'               ,[Avg Personal Fouls per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Turnovers per Minute'                    ,[Avg Turnovers per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Blocks per Minute'                       ,[Avg Blocks per Minute]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Points'                                  ,[Avg Points]											from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Plus Minus'                              ,[Avg Plus Minus]										from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Field Goals Made'                        ,[Avg Field Goals Made]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Field Goals Attempted'                   ,[Avg Field Goals Attempted]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Field Goal %'                            ,[Avg Field Goal %]									from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Free Throws Made'                        ,[Avg Free Throws Made]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Free Throws Attempted'                   ,[Avg Free Throws Attempted]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Free Throw %'                            ,[Avg Free Throw %]									from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Three Pointers Made'                     ,[Avg Three Pointers Made]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Three Pointers Attempted'                ,[Avg Three Pointers Attempted]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Three Pointer %'                         ,[Avg Three Pointer %]									from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Offensive Rebounds'                      ,[Avg Offensive Rebounds]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Defensive Rebounds'                      ,[Avg Defensive Rebounds]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Total Rebounds'                          ,[Avg Total Rebounds]									from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Assists'                                 ,[Avg Assists]											from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Personal Fouls'                          ,[Avg Personal Fouls]									from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Turnovers'                               ,[Avg Turnovers]										from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Avg Blocks'                                  ,[Avg Blocks]											from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Time Played (Minutes)'                       ,[Time Played (Minutes)]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Points Per Minute Ranking'                   ,[Points Per Minute Ranking]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Plus Minus Per Minute Ranking'               ,[Plus Minus Per Minute Ranking]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Field Goals Made Per Minute Ranking'         ,[Field Goals Made Per Minute Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Field Goals Attempted Per Minute Ranking'    ,[Field Goals Attempted Per Minute Ranking]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Offensive Rebounds Per Minute Ranking'       ,[Offensive Rebounds Per Minute Ranking]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Defensive Rebounds Per Minute Ranking'       ,[Defensive Rebounds Per Minute Ranking]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Total Rebounds Per Minute Ranking'           ,[Total Rebounds Per Minute Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Assists Per Minute Ranking'                  ,[Assists Per Minute Ranking]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Personal Fouls Per Minute Ranking'           ,[Personal Fouls Per Minute Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Turnovers Per Minute Ranking'                ,[Turnovers Per Minute Ranking]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Blocks Per Minute Ranking'                   ,[Blocks Per Minute Ranking]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Points Per Game Ranking'                     ,[Points Per Game Ranking]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Plus Minus Per Game Ranking'                 ,[Plus Minus Per Game Ranking]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Field Goals Made Per Game Ranking'           ,[Field Goals Made Per Game Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Field Goals Attempted Per Game Ranking'      ,[Field Goals Attempted Per Game Ranking]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Field Goal % Ranking'                        ,[Field Goal % Ranking]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Free Throws Made Per Game Ranking'           ,[Free Throws Made Per Game Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Free Throws Attempted Per Game Ranking'      ,[Free Throws Attempted Per Game Ranking]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Free Throw % Ranking'                        ,[Free Throw % Ranking]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Three Pointers Made Per Game Ranking'        ,[Three Pointers Made Per Game Ranking]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Three Pointers Attempted Per Game Ranking'   ,[Three Pointers Attempted Per Game Ranking]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Three Pointer % Ranking'                     ,[Three Pointer % Ranking]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Offensive Rebounds Per Game Ranking'         ,[Offensive Rebounds Per Game Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Defensive Rebounds Per Game Ranking'         ,[Defensive Rebounds Per Game Ranking]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Total Rebounds Per Game Ranking'             ,[Total Rebounds Per Game Ranking]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Assists Per Game Ranking'                    ,[Assists Per Game Ranking]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Personal Fouls Per Game Ranking'             ,[Personal Fouls Per Game Ranking]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Turnovers Per Game Ranking'                  ,[Turnovers Per Game Ranking]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Blocks Per Game Ranking'                     ,[Blocks Per Game Ranking]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Points Per Minute'                   ,[Percent Points Per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Plus Minus Per Minute'               ,[Percent Plus Minus Per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Made Per Minute'         ,[Percent Field Goals Made Per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Attempted Per Minute'    ,[Percent Field Goals Attempted Per Minute]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Offensive Rebounds Per Minute'       ,[Percent Offensive Rebounds Per Minute]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Defensive Rebounds Per Minute'       ,[Percent Defensive Rebounds Per Minute]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Total Rebounds Per Minute'           ,[Percent Total Rebounds Per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Assists Per Minute'                  ,[Percent Assists Per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Personal Fouls Per Minute'           ,[Percent Personal Fouls Per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Turnovers Per Minute'                ,[Percent Turnovers Per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Blocks Per Minute'                   ,[Percent Blocks Per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Points Per Game'                     ,[Percent Points Per Game]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Plus Minus Per Game'                 ,[Percent Plus Minus Per Game]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Made Per Game'           ,[Percent Field Goals Made Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Attempted Per Game'      ,[Percent Field Goals Attempted Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Field Goal %'                        ,[Percent Field Goal %]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Free Throws Made Per Game'           ,[Percent Free Throws Made Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Free Throws Attempted Per Game'      ,[Percent Free Throws Attempted Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Free Throw %'                        ,[Percent Free Throw %]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointers Made Per Game'        ,[Percent Three Pointers Made Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointers Attempted Per Game'   ,[Percent Three Pointers Attempted Per Game]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointer %'                     ,[Percent Three Pointer %]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Offensive Rebounds Per Game'         ,[Percent Offensive Rebounds Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Defensive Rebounds Per Game'         ,[Percent Defensive Rebounds Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Total Rebounds Per Game'             ,[Percent Total Rebounds Per Game]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Assists Per Game'                    ,[Percent Assists Per Game]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Personal Fouls Per Game'             ,[Percent Personal Fouls Per Game]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Turnovers Per Game'                  ,[Percent Turnovers Per Game]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
union all select [Player ID],[Player],[Season],[Group],'Percent Blocks Per Game'                     ,[Percent Blocks Per Game]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
*/

with t0 as
(
	select			 [Player ID],[Player],[Season],[Group],[Metric] = 'Percent Points Per Minute'			   ,[Value] = [Percent Points Per Minute]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Plus Minus Per Minute'               ,[Percent Plus Minus Per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Made Per Minute'         ,[Percent Field Goals Made Per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Attempted Per Minute'    ,[Percent Field Goals Attempted Per Minute]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Free Throws Made Per Minute'           ,[Percent Free Throws Made Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Free Throws Attempted Per Minute'      ,[Percent Free Throws Attempted Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointers Made Per Minute'        ,[Percent Three Pointers Made Per Minute]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointers Attempted Per Minute'   ,[Percent Three Pointers Attempted Per Minute]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Offensive Rebounds Per Minute'       ,[Percent Offensive Rebounds Per Minute]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Defensive Rebounds Per Minute'       ,[Percent Defensive Rebounds Per Minute]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Total Rebounds Per Minute'           ,[Percent Total Rebounds Per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Assists Per Minute'                  ,[Percent Assists Per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Personal Fouls Per Minute'           ,[Percent Personal Fouls Per Minute]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Turnovers Per Minute'                ,[Percent Turnovers Per Minute]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Blocks Per Minute'                   ,[Percent Blocks Per Minute]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Points Per Game'                     ,[Percent Points Per Game]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Plus Minus Per Game'                 ,[Percent Plus Minus Per Game]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Made Per Game'           ,[Percent Field Goals Made Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Field Goals Attempted Per Game'      ,[Percent Field Goals Attempted Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Field Goal %'                        ,[Percent Field Goal %]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Free Throws Made Per Game'           ,[Percent Free Throws Made Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Free Throws Attempted Per Game'      ,[Percent Free Throws Attempted Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Free Throw %'                        ,[Percent Free Throw %]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointers Made Per Game'        ,[Percent Three Pointers Made Per Game]				from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointers Attempted Per Game'   ,[Percent Three Pointers Attempted Per Game]			from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Three Pointer %'                     ,[Percent Three Pointer %]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Offensive Rebounds Per Game'         ,[Percent Offensive Rebounds Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Defensive Rebounds Per Game'         ,[Percent Defensive Rebounds Per Game]					from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Total Rebounds Per Game'             ,[Percent Total Rebounds Per Game]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Assists Per Game'                    ,[Percent Assists Per Game]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Personal Fouls Per Game'             ,[Percent Personal Fouls Per Game]						from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Turnovers Per Game'                  ,[Percent Turnovers Per Game]							from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
	union all select [Player ID],[Player],[Season],[Group],'Percent Blocks Per Game'                     ,[Percent Blocks Per Game]								from NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
)
select
[ID PlayerID - Season - Group - Metric] = concat([Player ID],' | ',[Season],' | ',[Group],' | ',replace([Metric],'Percent ','')) -- 202206151405
, *
from t0

GO


