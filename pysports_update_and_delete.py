UPDATE player
SET team_id = 2, 
	first_name = 'Gollum',
    last_name = 'Ring Stealer'
WHERE first_name = 'Smeagol';

DELETE FROM player
WHERE first_name = 'Smeagol';

INSERT INTO player (first_name, last_name, team_id)
	VALUES('Smeagol', 'Shire Folk', 1);
    
SELECT * FROM pysports.player;
SELECT player_id, first_name, last_name, team_name
FROM player 
INNER JOIN team
	ON player.team_id = team.team_id;
