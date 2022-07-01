## NOTES:
## error dates:

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
today = datetime.today()
yesterday = today - timedelta(days=1)
dates = [str(today.strftime('%Y-%m-%d'))]

for date in dates:
    
    ## throttle limits is 10 calls per minutes, so sleep with some cushion
    time.sleep(8)
    
    ## connect to api
    conn = http.client.HTTPSConnection("api-nba-v1.p.rapidapi.com")
    headers = {
        'X-RapidAPI-Host': "api-nba-v1.p.rapidapi.com",
        'X-RapidAPI-Key': "" // removed out
        }
    
    conn.request("GET", "/games?date=" + date, headers=headers)
    res = conn.getresponse()
    data = res.read()
    
    
    ## lists
    list_game_date = []
    list_external_id = []
    list_season = []
    list_duration = []
    list_away_team = []
    list_home_team = []
    list_wins_visitor = []
    list_losses_visitor = []
    list_q1_visitor = []
    list_q2_visitor = []
    list_q3_visitor = []
    list_q4_visitor = []
    list_score_visitor = []
    list_wins_home = []
    list_losses_home = []
    list_q1_home = []
    list_q2_home = []
    list_q3_home = []
    list_q4_home = []
    list_score_home = []
    list_officials = []
    list_times_tied = []
    list_lead_changes = []
    
    
    ## the data
    my_json = data.decode('utf8').replace("'", '"')
    my_json = my_json.replace('Sha"Rae Mitchell','ShaRae Mitchell')
    my_json = my_json.replace('Pat O"Connell','Pat OConnell')
    # my_json = 'r"""' + data.decode('utf8').replace("'", '"') + '"""'
    # my_json = ('r"""' + data.decode('utf8') + '"""').replace("'", '"')
    a = json.loads(my_json)
    
    
    ## loop through games in a day
    for game in a['response']:
        
        ## get values
        external_id = game['id']
        season = game['season']
        duration = game['date']['duration']
        away_team = game['teams']['visitors']['name']
        home_team = game['teams']['home']['name']
        wins_visitor = game['scores']['visitors']['win']
        losses_visitor = game['scores']['visitors']['loss']
        q1_visitor = game['scores']['visitors']['linescore'][0]
        q2_visitor = game['scores']['visitors']['linescore'][1]
        q3_visitor = game['scores']['visitors']['linescore'][2]
        q4_visitor = game['scores']['visitors']['linescore'][3]
        score_visitor = game['scores']['visitors']['points']
        wins_home = game['scores']['home']['win']
        losses_home = game['scores']['home']['loss']
        q1_home = game['scores']['home']['linescore'][0]
        q2_home = game['scores']['home']['linescore'][1]
        q3_home = game['scores']['home']['linescore'][2]
        q4_home = game['scores']['home']['linescore'][3]
        score_home = game['scores']['home']['points']
        officials = ",".join(game['officials'])
        times_tied = game['timesTied']
        lead_changes = game['leadChanges']
    
        ## append to list
        list_game_date.append(str(date))
        list_external_id.append(str(external_id))
        list_season.append(str(season      ))
        list_duration.append(str(duration    ))
        list_away_team.append(str(away_team   ))
        list_home_team.append(str(home_team   ))
        list_wins_visitor.append(str(wins_visitor))
        list_losses_visitor.append(str(losses_visitor))
        list_q1_visitor.append(str(q1_visitor  ))
        list_q2_visitor.append(str(q2_visitor  ))
        list_q3_visitor.append(str(q3_visitor  ))
        list_q4_visitor.append(str(q4_visitor  ))
        list_score_visitor.append(str(score_visitor))
        list_wins_home.append(str(wins_home   ))
        list_losses_home.append(str(losses_home ))
        list_q1_home.append(str(q1_home     ))
        list_q2_home.append(str(q2_home     ))
        list_q3_home.append(str(q3_home     ))
        list_q4_home.append(str(q4_home     ))
        list_score_home.append(str(score_home))
        list_officials.append(str(officials   ))
        list_times_tied.append(str(times_tied  ))
        list_lead_changes.append(str(lead_changes))
    
    
    ## create dataframe
    GameData_DF = DataFrame({
        'Game Date' : list_game_date
        ,'External ID' : list_external_id
        , 'Season' : list_season
        , 'Duration' : list_duration
        , 'Away Team' : list_away_team
        , 'Home Team' :  list_home_team
        , 'Away Team Wins' : list_wins_visitor
        , 'Away Team Losses' : list_losses_visitor
        , 'Away Q1 Points' : list_q1_visitor
        , 'Away Q2 Points' : list_q2_visitor
        , 'Away Q3 Points' : list_q3_visitor
        , 'Away Q4 Points' : list_q4_visitor
        , 'Away Score' : list_score_visitor
        , 'Home Team Wins' : list_wins_home
        , 'Home Team Losses' : list_losses_home
        , 'Home Q1 Points' : list_q1_home
        , 'Home Q2 Points' : list_q2_home
        , 'Home Q3 Points' : list_q3_home
        , 'Home Q4 Points' : list_q4_home
        , 'Home Score' : list_score_home
        , 'Officials' : list_officials
        , 'Times Tied' : list_times_tied
        , 'Lead Changes' : list_lead_changes
        })
    
    
    '''
    ## transfer into temp table
    for index, row in GameData_DF.iterrows():
        cursor.execute("""
                       INSERT INTO [Grant].[STG].[TBL_Scores_NBA]
                           (
                               [Game Date]
                               ,[External ID]
                               ,[Season]
                               ,[Duration]
                               ,[Away Team]
                               ,[Home Team]
                               ,[Away Team Wins]
                               ,[Away Team Losses]
                               ,[Away Q1 Points]
                               ,[Away Q2 Points]
                               ,[Away Q3 Points]
                               ,[Away Q4 Points]
                               ,[Away Score]
                               ,[Home Team Wins]
                               ,[Home Team Losses]
                               ,[Home Q1 Points]
                               ,[Home Q2 Points]
                               ,[Home Q3 Points]
                               ,[Home Q4 Points]
                               ,[Home Score]
                               ,[Officials]
                               ,[Times Tied]
                               ,[Lead Changes]
                        ) 
                        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                        """
                        ,row['Game Date']
                        ,row['External ID']
                        ,row['Season']
                        ,row['Duration']
                        ,row['Away Team']
                        ,row['Home Team']
                        ,row['Away Team Wins']
                        ,row['Away Team Losses']
                        ,row['Away Q1 Points']
                        ,row['Away Q2 Points']
                        ,row['Away Q3 Points']
                        ,row['Away Q4 Points']
                        ,row['Away Score']
                        ,row['Home Team Wins']
                        ,row['Home Team Losses']
                        ,row['Home Q1 Points']
                        ,row['Home Q2 Points']
                        ,row['Home Q3 Points']
                        ,row['Home Q4 Points']
                        ,row['Home Score']
                        ,row['Officials']
                        ,row['Times Tied']
                        ,row['Lead Changes']
                        )
        connection.commit()
    
    
    ## transfer from stg to actual
    SQL = "{call [Grant].[NBA].[SP_InsertInto_Scores]}"
    cursor.execute(SQL)
    connection.commit()
    '''



    print(date)


## close connection
cursor.close();
connection.close();
