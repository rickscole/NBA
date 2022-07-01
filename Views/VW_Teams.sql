/****** Object:  View [NBA].[VW_Teams]    Script Date: 7/1/2022 2:38:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [NBA].[VW_Teams] as
select 
distinct
[Team ID]
, [Team Name]
, [Is NBA Team?] = 
	case
		when [Team Name] in	
			(
				'Atlanta Hawks'
				, 'Boston Celtics'
				, 'Brooklyn Nets'
				, 'Charlotte Hornets'
				, 'Chicago Bulls'
				, 'Cleveland Cavaliers'
				, 'Dallas Mavericks'
				, 'Denver Nuggets'
				, 'Detroit Pistons'
				, 'Golden State Warriors'
				, 'Houston Rockets'
				, 'Indiana Pacers'
				, 'LA Clippers'
				, 'Los Angeles Lakers'
				, 'Memphis Grizzlies'
				, 'Miami Heat'
				, 'Milwaukee Bucks'
				, 'Minnesota Timberwolves'
				, 'New Orleans Pelicans'
				, 'New York Knicks'
				, 'Oklahoma City Thunder'
				, 'Orlando Magic'
				, 'Philadelphia 76ers'
				, 'Phoenix Suns'
				, 'Portland Trail Blazers'
				, 'Sacramento Kings'
				, 'San Antonio Spurs'
				, 'Toronto Raptors'
				, 'Utah Jazz'
				, 'Washington Wizards'
			)
		then 1
		else 0
	end
from nba.tbl_playergamestats
GO


