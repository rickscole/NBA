/****** Object:  StoredProcedure [NBA].[SP_InsertInto_PlayerGameTeamStats_PerPlayerSeason_Percent]    Script Date: 7/1/2022 2:51:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [NBA].[SP_InsertInto_PlayerGameTeamStats_PerPlayerSeason_Percent] as

drop table  NBA.TBL_PlayerGameTeamStats_PerPlayerSeason_Percent

;
with t0 as
(
	select *, [Group] = '>= 1000' from [NBA].[VW_PlayerGameTeamStats_Average] where [Time Played (Minutes)] >= 1000
	union all select *, [Group] = '>= 500' from [NBA].[VW_PlayerGameTeamStats_Average] where [Time Played (Minutes)] >= 500
	union all select *, [Group] = '>= 250' from [NBA].[VW_PlayerGameTeamStats_Average] where [Time Played (Minutes)] >= 250
	union all select *, [Group] = '>= 0' from [NBA].[VW_PlayerGameTeamStats_Average] where [Time Played (Minutes)] >= 0
)
select r.* 
, [Percent Points Per Minute]               = case when ( [Max Points Per Minute]                -[Min Points Per Minute] = 0 ) then null else ([Avg Points Per Minute]                -[Min Points Per Minute]                ) / ([Max Points Per Minute]                -[Min Points Per Minute]                ) end
, [Percent Plus Minus Per Minute]           = case when ( [Max Plus Minus Per Minute]            -[Min Plus Minus Per Minute] = 0 ) then null else ([Avg Plus Minus Per Minute]            -[Min Plus Minus Per Minute]            ) / ([Max Plus Minus Per Minute]            -[Min Plus Minus Per Minute]            ) end
, [Percent Field Goals Made Per Minute]     = case when ( [Max Field Goals Made Per Minute]      -[Min Field Goals Made Per Minute] = 0 ) then null else ([Avg Field Goals Made Per Minute]      -[Min Field Goals Made Per Minute]      ) / ([Max Field Goals Made Per Minute]      -[Min Field Goals Made Per Minute]      ) end
, [Percent Field Goals Attempted Per Minute]= case when ( [Max Field Goals Attempted Per Minute] -[Min Field Goals Attempted Per Minute]= 0 ) then null else ([Avg Field Goals Attempted Per Minute] -[Min Field Goals Attempted Per Minute] ) / ([Max Field Goals Attempted Per Minute] -[Min Field Goals Attempted Per Minute] ) end
, [Percent Free Throws Made Per Minute]                = case when ( [Max Free Throws Made Per Minute]                 -[Min Free Throws Made Per Minute]  = 0 ) then null else ([Avg Free Throws Made Per Minute]                 -[Min Free Throws Made Per Minute]                 ) / ([Max Free Throws Made Per Minute]                 -[Min Free Throws Made Per Minute]                 ) end
, [Percent Free Throws Attempted Per Minute]           = case when ( [Max Free Throws Attempted Per Minute]            -[Min Free Throws Attempted Per Minute]   = 0 ) then null else ([Avg Free Throws Attempted Per Minute]            -[Min Free Throws Attempted Per Minute]            ) / ([Max Free Throws Attempted Per Minute]            -[Min Free Throws Attempted Per Minute]            ) end
, [Percent Three Pointers Made Per Minute]                = case when ( [Max Three Pointers Made Per Minute]                 -[Min Three Pointers Made Per Minute]    = 0 ) then null else ([Avg Three Pointers Made Per Minute]                 -[Min Three Pointers Made Per Minute]                 ) / ([Max Three Pointers Made Per Minute]                 -[Min Three Pointers Made Per Minute]                 ) end
, [Percent Three Pointers Attempted Per Minute]           = case when ( [Max Three Pointers Attempted Per Minute]            -[Min Three Pointers Attempted Per Minute]= 0 ) then null else ([Avg Three Pointers Attempted Per Minute]            -[Min Three Pointers Attempted Per Minute]            ) / ([Max Three Pointers Attempted Per Minute]            -[Min Three Pointers Attempted Per Minute]            ) end
, [Percent Offensive Rebounds Per Minute]   = case when ( [Max Offensive Rebounds Per Minute]    -[Min Offensive Rebounds Per Minute]= 0 ) then null else ([Avg Offensive Rebounds Per Minute]    -[Min Offensive Rebounds Per Minute]    ) / ([Max Offensive Rebounds Per Minute]    -[Min Offensive Rebounds Per Minute]    ) end
, [Percent Defensive Rebounds Per Minute]   = case when ( [Max Defensive Rebounds Per Minute]    -[Min Defensive Rebounds Per Minute]= 0 ) then null else ([Avg Defensive Rebounds Per Minute]    -[Min Defensive Rebounds Per Minute]    ) / ([Max Defensive Rebounds Per Minute]    -[Min Defensive Rebounds Per Minute]    ) end
, [Percent Total Rebounds Per Minute]       = case when ( [Max Total Rebounds Per Minute]        -[Min Total Rebounds Per Minute] = 0 ) then null else ([Avg Total Rebounds Per Minute]        -[Min Total Rebounds Per Minute]        ) / ([Max Total Rebounds Per Minute]        -[Min Total Rebounds Per Minute]        ) end
, [Percent Assists Per Minute]              = case when ( [Max Assists Per Minute]               -[Min Assists Per Minute]   = 0 ) then null else ([Avg Assists Per Minute]               -[Min Assists Per Minute]               ) / ([Max Assists Per Minute]               -[Min Assists Per Minute]               ) end
, [Percent Personal Fouls Per Minute]       = case when ( [Max Personal Fouls Per Minute]        -[Min Personal Fouls Per Minute]  = 0 ) then null else 1 - ([Avg Personal Fouls Per Minute]        -[Min Personal Fouls Per Minute]        ) / ([Max Personal Fouls Per Minute]        -[Min Personal Fouls Per Minute]        ) end
, [Percent Turnovers Per Minute]            = case when ( [Max Turnovers Per Minute]             -[Min Turnovers Per Minute]  = 0 ) then null else 1 - ([Avg Turnovers Per Minute]             -[Min Turnovers Per Minute]             ) / ([Max Turnovers Per Minute]             -[Min Turnovers Per Minute]             ) end
, [Percent Blocks Per Minute]               = case when ( [Max Blocks Per Minute]                -[Min Blocks Per Minute]= 0 ) then null else ([Avg Blocks Per Minute]                -[Min Blocks Per Minute]                ) / ([Max Blocks Per Minute]                -[Min Blocks Per Minute]                ) end
, [Percent Points Per Game]                          = case when ( [Max Points]                           -[Min Points]    = 0 ) then null else ([Avg Points]                           -[Min Points]                           ) / ([Max Points]                           -[Min Points]                           ) end
, [Percent Plus Minus Per Game]                      = case when ( [Max Plus Minus]                       -[Min Plus Minus] = 0 ) then null else ([Avg Plus Minus]                       -[Min Plus Minus]                       ) / ([Max Plus Minus]                       -[Min Plus Minus]                       ) end
, [Percent Field Goals Made Per Game]                = case when ( [Max Field Goals Made]                 -[Min Field Goals Made] = 0 ) then null else ([Avg Field Goals Made]                 -[Min Field Goals Made]                 ) / ([Max Field Goals Made]                 -[Min Field Goals Made]                 ) end
, [Percent Field Goals Attempted Per Game]           = case when ( [Max Field Goals Attempted]            -[Min Field Goals Attempted] = 0 ) then null else ([Avg Field Goals Attempted]            -[Min Field Goals Attempted]            ) / ([Max Field Goals Attempted]            -[Min Field Goals Attempted]            ) end
, [Percent Field Goal %]                    = case when ( [Max Field Goal %]                     -[Min Field Goal %]  = 0 ) then null else ([Avg Field Goal %]                     -[Min Field Goal %]                     ) / ([Max Field Goal %]                     -[Min Field Goal %]                     ) end
, [Percent Free Throws Made Per Game]                = case when ( [Max Free Throws Made]                 -[Min Free Throws Made] = 0 ) then null else ([Avg Free Throws Made]                 -[Min Free Throws Made]                 ) / ([Max Free Throws Made]                 -[Min Free Throws Made]                 ) end
, [Percent Free Throws Attempted Per Game]           = case when ( [Max Free Throws Attempted]            -[Min Free Throws Attempted] = 0 ) then null else ([Avg Free Throws Attempted]            -[Min Free Throws Attempted]            ) / ([Max Free Throws Attempted]            -[Min Free Throws Attempted]            ) end
, [Percent Free Throw %]                    = case when ( [Max Free Throw %]                     -[Min Free Throw %]   = 0 ) then null else ([Avg Free Throw %]                     -[Min Free Throw %]                     ) / ([Max Free Throw %]                     -[Min Free Throw %]                     ) end
, [Percent Three Pointers Made Per Game]             = case when ( [Max Three Pointers Made]              -[Min Three Pointers Made]  = 0 ) then null else ([Avg Three Pointers Made]              -[Min Three Pointers Made]              ) / ([Max Three Pointers Made]              -[Min Three Pointers Made]              ) end
, [Percent Three Pointers Attempted Per Game]        = case when ( [Max Three Pointers Attempted]         -[Min Three Pointers Attempted] = 0 ) then null else ([Avg Three Pointers Attempted]         -[Min Three Pointers Attempted]         ) / ([Max Three Pointers Attempted]         -[Min Three Pointers Attempted]         ) end
, [Percent Three Pointer %]                 = case when ( [Max Three Pointer %]                  -[Min Three Pointer %]      = 0 ) then null else ([Avg Three Pointer %]                  -[Min Three Pointer %]                  ) / ([Max Three Pointer %]                  -[Min Three Pointer %]                  ) end
, [Percent Offensive Rebounds Per Game]              = case when ( [Max Offensive Rebounds]               -[Min Offensive Rebounds]    = 0 ) then null else ([Avg Offensive Rebounds]               -[Min Offensive Rebounds]               ) / ([Max Offensive Rebounds]               -[Min Offensive Rebounds]               ) end
, [Percent Defensive Rebounds Per Game]              = case when ( [Max Defensive Rebounds]               -[Min Defensive Rebounds]  = 0 ) then null else ([Avg Defensive Rebounds]               -[Min Defensive Rebounds]               ) / ([Max Defensive Rebounds]               -[Min Defensive Rebounds]               ) end
, [Percent Total Rebounds Per Game]                  = case when ( [Max Total Rebounds]                   -[Min Total Rebounds]   = 0 ) then null else ([Avg Total Rebounds]                   -[Min Total Rebounds]                   ) / ([Max Total Rebounds]                   -[Min Total Rebounds]                   ) end
, [Percent Assists Per Game]                         = case when ( [Max Assists]                          -[Min Assists]   = 0 ) then null else ([Avg Assists]                          -[Min Assists]                          ) / ([Max Assists]                          -[Min Assists]                          ) end
, [Percent Personal Fouls Per Game]                  = case when ( [Max Personal Fouls]                   -[Min Personal Fouls]    = 0 ) then null else 1 - ([Avg Personal Fouls]                   -[Min Personal Fouls]                   ) / ([Max Personal Fouls]                   -[Min Personal Fouls]                   ) end
, [Percent Turnovers Per Game]                       = case when ( [Max Turnovers]                        -[Min Turnovers]   = 0 ) then null else 1 - ([Avg Turnovers]                        -[Min Turnovers]                        ) / ([Max Turnovers]                        -[Min Turnovers]                        ) end
, [Percent Blocks Per Game]                          = case when ( [Max Blocks]                           -[Min Blocks]            = 0 ) then null else ([Avg Blocks]                           -[Min Blocks]                           ) / ([Max Blocks]                           -[Min Blocks]                           ) end
into NBA.TBL_PlayerGameTeamStats_PerPlayerSeason_Percent
from t0 r
left join [NBA].[VW_PlayerGameTeamStats_MaxAndMin] mm
on r.[Group] = mm.[group]
and r.[Team ID] = mm.[Team ID]
and r.Season = mm.Season
GO


