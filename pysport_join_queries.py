import mysql.connector
from mysql.connector import errorcode 
 
db = mysql.connector.connect(
	host="localhost",
	user="root",
	passwd="password",
	database="pysports"
	)

SELECT player_id, first_name, last_name, team_name
FROM player
INNER JOIN team
	ON player.team_id = team.team_id;
