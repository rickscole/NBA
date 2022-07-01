## PURPOSE
## 202205270040
## drop and create [NBA].[TBL_PlayerGameStats_PerPlayerSeason_Percent] nightly
## creating it as a view is not itself a bad idea, but the layer on top of it calls the "View" multiple times (20 or something like that)...
## ... and at that point it becomes expensive


## import libraries
import time
import pyodbc
import pandas
from pandas import DataFrame
import numpy as np
import os


## create connection to db
connection = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};''Server=abyss.database.windows.net;''Database=Grant;''UID=;''PWD=;') // removed out
cursor = connection.cursor()


## delete from staging table
sql = "{call [Grant].[NBA].[SP_InsertInto_PlayerGameStats_PerPlayerSeason_Percent]}"
cursor.execute(sql)
connection.commit()


## close connection
cursor.close();
connection.close();
