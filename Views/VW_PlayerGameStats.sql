/****** Object:  View [NBA].[VW_PlayerGameStats]    Script Date: 7/1/2022 12:41:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [NBA].[VW_PlayerGameStats] as
with t0 as
(
	select *
	, [Minutes Component] = cast(case when len(minutes) = 5 then try_convert(int,left(minutes,2)) else try_convert(int,left(minutes,1)) end as float)
	, [Seconds Component] = cast(try_convert(int,right(minutes,2)) as float)
	, [Total Rebounds] = isnull([Offensive Rebounds],0) + isnull([Defensive Rebounds],0)
	, [Field Goal %] = case when try_convert(int,[Field Goals Made]) = 0 then null else try_convert(float,[Field Goals Made]) / try_convert(float,[Field Goals Attempted]) end
	, [Three Point %] = case when try_convert(int,[Three Pointers Made]) = 0 then null else try_convert(float,[Three Pointers Made]) / try_convert(float,[Three Pointers Attempted]) end
	, [Free Throw %] = case when try_convert(int,[Free Throws Made]) = 0 then null else try_convert(float,[Free Throws Made]) / try_convert(float,[Free Throws Attempted]) end
	from [NBA].[TBL_PlayerGameStats]
)
select 
*
, [Time Played (Minutes)] = [Minutes Component] + [Seconds Component] / cast(60 as float)
, [Time Played (Seconds)] = [Minutes Component] * cast(60 as float) + [Seconds Component]
from t0
GO


