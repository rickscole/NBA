/****** Object:  StoredProcedure [NBA].[SP_InsertInto_PlayerGameStats_PerPlayerSeason_Percent]    Script Date: 7/1/2022 2:53:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [NBA].[SP_InsertInto_PlayerGameStats_PerPlayerSeason_Percent] as


drop table NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent

;
with t0 as
(
	select *, [Group] = '>= 2500' from [NBA].[VW_PlayerGameStats_Average] where [Time Played (Minutes)] >= 2500
	union all select *, [Group] = '>= 2000' from [NBA].[VW_PlayerGameStats_Average] where [Time Played (Minutes)] >= 2000
	union all select *, [Group] = '>= 1500' from [NBA].[VW_PlayerGameStats_Average] where [Time Played (Minutes)] >= 1500
	union all select *, [Group] = '>= 1000' from [NBA].[VW_PlayerGameStats_Average] where [Time Played (Minutes)] >= 1000
	union all select *, [Group] = '>= 0' from [NBA].[VW_PlayerGameStats_Average] where [Time Played (Minutes)] >= 0
)
select r.* 
, [Percent Points Per Minute]               = ([Avg Points Per Minute]                -[Min Points Per Minute]                ) / ([Max Points Per Minute]                -[Min Points Per Minute]                )
, [Percent Plus Minus Per Minute]           = ([Avg Plus Minus Per Minute]            -[Min Plus Minus Per Minute]            ) / ([Max Plus Minus Per Minute]            -[Min Plus Minus Per Minute]            )
, [Percent Field Goals Made Per Minute]     = ([Avg Field Goals Made Per Minute]      -[Min Field Goals Made Per Minute]      ) / ([Max Field Goals Made Per Minute]      -[Min Field Goals Made Per Minute]      )
, [Percent Field Goals Attempted Per Minute]= ([Avg Field Goals Attempted Per Minute] -[Min Field Goals Attempted Per Minute] ) / ([Max Field Goals Attempted Per Minute] -[Min Field Goals Attempted Per Minute] )
, [Percent Free Throws Made Per Minute]                = ([Avg Free Throws Made Per Minute]                 -[Min Free Throws Made Per Minute]                 ) / ([Max Free Throws Made Per Minute]                 -[Min Free Throws Made Per Minute]                 )
, [Percent Free Throws Attempted Per Minute]           = ([Avg Free Throws Attempted Per Minute]            -[Min Free Throws Attempted Per Minute]            ) / ([Max Free Throws Attempted Per Minute]            -[Min Free Throws Attempted Per Minute]            )
, [Percent Three Pointers Made Per Minute]                = ([Avg Three Pointers Made Per Minute]                 -[Min Three Pointers Made Per Minute]                 ) / ([Max Three Pointers Made Per Minute]                 -[Min Three Pointers Made Per Minute]                 )
, [Percent Three Pointers Attempted Per Minute]           = ([Avg Three Pointers Attempted Per Minute]            -[Min Three Pointers Attempted Per Minute]            ) / ([Max Three Pointers Attempted Per Minute]            -[Min Three Pointers Attempted Per Minute]            )
, [Percent Offensive Rebounds Per Minute]   = ([Avg Offensive Rebounds Per Minute]    -[Min Offensive Rebounds Per Minute]    ) / ([Max Offensive Rebounds Per Minute]    -[Min Offensive Rebounds Per Minute]    )
, [Percent Defensive Rebounds Per Minute]   = ([Avg Defensive Rebounds Per Minute]    -[Min Defensive Rebounds Per Minute]    ) / ([Max Defensive Rebounds Per Minute]    -[Min Defensive Rebounds Per Minute]    )
, [Percent Total Rebounds Per Minute]       = ([Avg Total Rebounds Per Minute]        -[Min Total Rebounds Per Minute]        ) / ([Max Total Rebounds Per Minute]        -[Min Total Rebounds Per Minute]        )
, [Percent Assists Per Minute]              = ([Avg Assists Per Minute]               -[Min Assists Per Minute]               ) / ([Max Assists Per Minute]               -[Min Assists Per Minute]               )
, [Percent Personal Fouls Per Minute]       = 1 - ([Avg Personal Fouls Per Minute]        -[Min Personal Fouls Per Minute]        ) / ([Max Personal Fouls Per Minute]        -[Min Personal Fouls Per Minute]        )
, [Percent Turnovers Per Minute]            = 1 - ([Avg Turnovers Per Minute]             -[Min Turnovers Per Minute]             ) / ([Max Turnovers Per Minute]             -[Min Turnovers Per Minute]             )
, [Percent Blocks Per Minute]               = ([Avg Blocks Per Minute]                -[Min Blocks Per Minute]                ) / ([Max Blocks Per Minute]                -[Min Blocks Per Minute]                )
, [Percent Points Per Game]                          = ([Avg Points]                           -[Min Points]                           ) / ([Max Points]                           -[Min Points]                           )
, [Percent Plus Minus Per Game]                      = ([Avg Plus Minus]                       -[Min Plus Minus]                       ) / ([Max Plus Minus]                       -[Min Plus Minus]                       )
, [Percent Field Goals Made Per Game]                = ([Avg Field Goals Made]                 -[Min Field Goals Made]                 ) / ([Max Field Goals Made]                 -[Min Field Goals Made]                 )
, [Percent Field Goals Attempted Per Game]           = ([Avg Field Goals Attempted]            -[Min Field Goals Attempted]            ) / ([Max Field Goals Attempted]            -[Min Field Goals Attempted]            )
, [Percent Field Goal %]                    = ([Avg Field Goal %]                     -[Min Field Goal %]                     ) / ([Max Field Goal %]                     -[Min Field Goal %]                     )
, [Percent Free Throws Made Per Game]                = ([Avg Free Throws Made]                 -[Min Free Throws Made]                 ) / ([Max Free Throws Made]                 -[Min Free Throws Made]                 )
, [Percent Free Throws Attempted Per Game]           = ([Avg Free Throws Attempted]            -[Min Free Throws Attempted]            ) / ([Max Free Throws Attempted]            -[Min Free Throws Attempted]            )
, [Percent Free Throw %]                    = ([Avg Free Throw %]                     -[Min Free Throw %]                     ) / ([Max Free Throw %]                     -[Min Free Throw %]                     )
, [Percent Three Pointers Made Per Game]             = ([Avg Three Pointers Made]              -[Min Three Pointers Made]              ) / ([Max Three Pointers Made]              -[Min Three Pointers Made]              )
, [Percent Three Pointers Attempted Per Game]        = ([Avg Three Pointers Attempted]         -[Min Three Pointers Attempted]         ) / ([Max Three Pointers Attempted]         -[Min Three Pointers Attempted]         )
, [Percent Three Pointer %]                 = ([Avg Three Pointer %]                  -[Min Three Pointer %]                  ) / ([Max Three Pointer %]                  -[Min Three Pointer %]                  )
, [Percent Offensive Rebounds Per Game]              = ([Avg Offensive Rebounds]               -[Min Offensive Rebounds]               ) / ([Max Offensive Rebounds]               -[Min Offensive Rebounds]               )
, [Percent Defensive Rebounds Per Game]              = ([Avg Defensive Rebounds]               -[Min Defensive Rebounds]               ) / ([Max Defensive Rebounds]               -[Min Defensive Rebounds]               )
, [Percent Total Rebounds Per Game]                  = ([Avg Total Rebounds]                   -[Min Total Rebounds]                   ) / ([Max Total Rebounds]                   -[Min Total Rebounds]                   )
, [Percent Assists Per Game]                         = ([Avg Assists]                          -[Min Assists]                          ) / ([Max Assists]                          -[Min Assists]                          )
, [Percent Personal Fouls Per Game]                  = 1 - ([Avg Personal Fouls]                   -[Min Personal Fouls]                   ) / ([Max Personal Fouls]                   -[Min Personal Fouls]                   )
, [Percent Turnovers Per Game]                       = 1 - ([Avg Turnovers]                        -[Min Turnovers]                        ) / ([Max Turnovers]                        -[Min Turnovers]                        )
, [Percent Blocks Per Game]                          = ([Avg Blocks]                           -[Min Blocks]                           ) / ([Max Blocks]                           -[Min Blocks]                           )
into NBA.TBL_PlayerGameStats_PerPlayerSeason_Percent
from t0 r
left join [NBA].[VW_PlayerGameStats_MaxAndMin] mm
on r.[Group] = mm.[group]



GO


