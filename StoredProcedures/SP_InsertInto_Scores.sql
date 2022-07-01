/****** Object:  StoredProcedure [NBA].[SP_InsertInto_Scores]    Script Date: 7/1/2022 12:34:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create procedure [NBA].[SP_InsertInto_Scores] as

-- insert into staging table
insert into [Grant].[NBA].[TBL_Scores]
select 
sysdatetime()
, [External ID] = try_convert(int, [External ID])
, season = try_convert(int, season)
, duration
, [Away Team]
, [Home Team]
, [Away Team Wins] = try_convert(tinyint, [Away Team Wins])
, [Away Team Losses] = try_convert(tinyint, [Away Team Losses])
, [Away Q1 Points] = try_convert(tinyint, [Away Q1 Points])
, [Away Q2 Points] = try_convert(tinyint, [Away Q2 Points])
, [Away Q3 Points] = try_convert(tinyint, [Away Q3 Points])
, [Away Q4 Points] = try_convert(tinyint, [Away Q4 Points])
, [Away Score] = try_convert(smallint, [Away Score])
, [Home Team Wins] = try_convert(tinyint, [Home Team Wins])
, [Home Team Losses] = try_convert(tinyint, [Home Team Losses])
, [Home Q1 Points] = try_convert(tinyint, [Home Q1 Points])
, [Home Q2 Points] = try_convert(tinyint, [Home Q2 Points])
, [Home Q3 Points] = try_convert(tinyint, [Home Q3 Points])
, [Home Q4 Points] = try_convert(tinyint, [Home Q4 Points])
, [Home Score] = try_convert(smallint, [Home Score])
, [Officials]
, [Times Tied] = try_convert(tinyint, [Times Tied])
, [Lead Changes] = try_convert(tinyint, [Lead Changes])
, [Game Date] = try_convert(date, [Game Date])
from [Grant].[STG].[TBL_Scores_NBA]


-- delete from staging table
delete from [Grant].[STG].[TBL_Scores_NBA]
GO


