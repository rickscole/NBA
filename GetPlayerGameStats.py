## import libraries
import pyodbc
import http.client
import json
import pandas as pd
from pandas import DataFrame
import time
from datetime import datetime
from datetime import timedelta


## create connection to db
connection = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};''Server=abyss.database.windows.net;''Database=Grant;''UID=;''PWD=;') // removed out
cursor = connection.cursor()



## temp vars
##season = '2020'
seasons = [2021]
#seasons = [2015]
team_ids = range(10,11)

for team in team_ids:
    for season in seasons:
        
        print(season)
            
        ## 202205011938
        time.sleep(8)
        
        ## get data
        conn = http.client.HTTPSConnection("api-nba-v1.p.rapidapi.com")
        headers = {
            'X-RapidAPI-Host': "api-nba-v1.p.rapidapi.com",
            'X-RapidAPI-Key': "" // removed out
            }
        
        conn.request("GET", "/players/statistics?team=" + str(team) + "&season=" + str(season), headers=headers)
        res = conn.getresponse()
        data = res.read()
        my_json = data.decode('utf8').replace("'", '"')
        my_json = my_json.replace('De"Andre','DeAndre')
        my_json = my_json.replace('St.Mary"s','St.Marys')
        my_json = my_json.replace('DeAndre"','DeAndre')
        my_json = my_json.replace('St. Joseph"s','St. Josephs')
        my_json = my_json.replace('Day"Ron','DayRon')
        my_json = my_json.replace('Jae"Sean','JaeSean')
        my_json = my_json.replace('St. Mary"s','St. Marys')
        my_json = my_json.replace('"DeAndre,"','"DeAndre","')
        my_json = my_json.replace('De"Anthony','DeAnthony')
        my_json = my_json.replace('O"Bryant','OBryant')
        my_json = my_json.replace('D"Angelo','DAngelo')
        my_json = my_json.replace('Devonte"','Devonte')
        my_json = my_json.replace('E"Twaun','ETwaun')
        my_json = my_json.replace('"Devonte,"','"Devonte","')
        my_json = my_json.replace('De"Aaron','DeAaron')
        my_json = my_json.replace('Jahmi"us','Jahmius')
        my_json = my_json.replace('St. John"s','St. Johns')
        my_json = my_json.replace('St.John"s','St.Johns')
        my_json = my_json.replace('Sir"Dominic','SirDominic')
        my_json = my_json.replace('Pe"Shon','PeShon')
        my_json = my_json.replace('O"Quinn','OQuinn')
        my_json = my_json.replace('D"Vauntes','DVauntes')
        my_json = my_json.replace('O"Brien','OBrien')
        my_json = my_json.replace('Toure"','Toure')
        my_json = my_json.replace('Amar"e','Amare')
        my_json = my_json.replace('DNP - Coach"s Decision','DNP - Coachs Decision')
        my_json = my_json.replace('NWT - Coach"s Decision','NWT - Coachs Decision')
        my_json = my_json.replace('DND - Coach"s Decision','DND - Coachs Decision')
        my_json = my_json.replace('O"Neale','ONeale')
        my_json = my_json.replace('Tre"Shaun','TreShaun')
        a = json.loads(my_json)
        
        
        ## lists
        list_player_id = []
        list_first_name = []
        list_last_name = []
        list_team_id = []
        list_team_name = []
        list_game_id = []
        list_points = []
        list_position = []
        list_minutes = []
        list_field_goals_made = []
        list_field_goals_attempted = []
        list_free_throws_made = []
        list_free_throws_attempted = []
        list_three_pointers_made = []
        list_three_pointers_attempted = []
        list_offensive_rebounds = []
        list_defensive_rebounds = []
        list_assists = []
        list_personal_fouls = []
        list_steals = []
        list_turnovers = []
        list_blocks = []
        list_plus_minus = []
        list_comment = []
        list_season = []
        
        
        ## loop through players / games
        for player_game in a['response']:
            
            ## get fields
            player_id = player_game['player']['id']
            first_name = player_game['player']['firstname']
            last_name = player_game['player']['lastname']
            team_id = player_game['team']['id']
            team_name = player_game['team']['name']
            game_id = player_game['game']['id']
            points = player_game['points']
            position = player_game['pos']
            minutes = player_game['min']
            field_goals_made = player_game['fgm']
            field_goals_attempted = player_game['fga']
            free_throws_made = player_game['ftm']
            free_throws_attempted = player_game['fta']
            three_pointers_made = player_game['tpm']
            three_pointers_attempted = player_game['tpa']
            offensive_rebounds = player_game['offReb']
            defensive_rebounds = player_game['defReb']
            assists = player_game['assists']
            personal_fouls = player_game['pFouls']
            steals = player_game['steals']
            turnovers = player_game['turnovers']
            blocks = player_game['blocks']
            plus_minus = player_game['plusMinus']
            comment = player_game['comment']
            
            
            ## append to list
            list_player_id.append(str(player_id))
            list_first_name.append(str(first_name))
            list_last_name.append(str(last_name))
            list_team_id.append(str(team_id))
            list_team_name.append(str(team_name))
            list_game_id.append(str(game_id))
            list_points.append(str(points))
            list_position.append(str(position))
            list_minutes.append(str(minutes))
            list_field_goals_made.append(str(field_goals_made))
            list_field_goals_attempted.append(str(field_goals_attempted))
            list_free_throws_made.append(str(free_throws_made))
            list_free_throws_attempted.append(str(free_throws_attempted))
            list_three_pointers_made.append(str(three_pointers_made))
            list_three_pointers_attempted.append(str(three_pointers_attempted))
            list_offensive_rebounds.append(str(offensive_rebounds))
            list_defensive_rebounds.append(str(defensive_rebounds))
            list_assists.append(str(assists))
            list_personal_fouls.append(str(personal_fouls))
            list_turnovers.append(str(turnovers))
            list_blocks.append(str(blocks))
            list_plus_minus.append(str(plus_minus))
            list_comment.append(str(comment))
            list_season.append(str(season))
        
        
        ## create dataframe
        PlayerGameStats_DF = DataFrame({
            'Player ID' : list_player_id
            ,'First Name' : list_first_name
            ,'Last Name' : list_last_name
            ,'Team ID' : list_team_id
            ,'Team Name' : list_team_name
            ,'Game ID' : list_game_id
            ,'Points' : list_points
            ,'Position' : list_position
            ,'Minutes' : list_minutes
            ,'Field Goals Made' : list_field_goals_made
            ,'Field Goals Attempted' : list_field_goals_attempted
            ,'Free Throws Made' : list_free_throws_made
            ,'Free Throws Attempted' : list_free_throws_attempted
            ,'Three Pointers Made' : list_three_pointers_made
            ,'Three Pointers Attempted' : list_three_pointers_attempted
            ,'Offensive Rebounds' : list_offensive_rebounds
            ,'Defensive Rebounds' : list_defensive_rebounds
            ,'Assists' : list_assists
            ,'Personal Fouls' : list_personal_fouls
            ,'Turnovers' : list_turnovers
            ,'Blocks' : list_blocks
            ,'Plus Minus' : list_plus_minus
            ,'Comment' : list_comment
            ,'Season' : list_season
            })
        
        
        ## transfer into temp table
        for index, row in PlayerGameStats_DF.iterrows():
            cursor.execute("""
                           insert into [Grant].[STG].[TBL_PlayerGameStats_NBA]
                            (
                                [Player ID]
                                ,[First Name]
                                ,[Last Name]
                                ,[Team ID]
                                ,[Team Name]
                                ,[Game ID]
                                ,[Points]
                                ,[Position]
                                ,[Minutes]
                                ,[Field Goals Made]
                                ,[Field Goals Attempted]
                                ,[Free Throws Made]
                                ,[Free Throws Attempted]
                                ,[Three Pointers Made]
                                ,[Three Pointers Attempted]
                                ,[Offensive Rebounds]
                                ,[Defensive Rebounds]
                                ,[Assists]
                                ,[Personal Fouls]
                                ,[Turnovers]
                                ,[Blocks]
                                ,[Plus Minus]
                                ,[Comment]
                                ,[Season]
                            )
            
                            values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                            """
                            ,row['Player ID']
                            ,row['First Name']
                            ,row['Last Name']
                            ,row['Team ID']
                            ,row['Team Name']
                            ,row['Game ID']
                            ,row['Points']
                            ,row['Position']
                            ,row['Minutes']
                            ,row['Field Goals Made']
                            ,row['Field Goals Attempted']
                            ,row['Free Throws Made']
                            ,row['Free Throws Attempted']
                            ,row['Three Pointers Made']
                            ,row['Three Pointers Attempted']
                            ,row['Offensive Rebounds']
                            ,row['Defensive Rebounds']
                            ,row['Assists']
                            ,row['Personal Fouls']
                            ,row['Turnovers']
                            ,row['Blocks']
                            ,row['Plus Minus']
                            ,row['Comment']
                            ,row['Season']
                            )
            connection.commit()
        
        
         ## transfer from stg to actual
        SQL = "{call [Grant].[NBA].[SP_InsertInto_PlayerGameStats]}"
        cursor.execute(SQL)
        connection.commit()

## close connection
cursor.close();
connection.close();
