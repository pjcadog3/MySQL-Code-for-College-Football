SELECT * FROM college.football_players;
SELECT * FROM college.football_teams;

CREATE DATABASE college;
USE college;


SELECT MAX(weight) FROM college.football_players;

SELECT MIN(height) FROM college.football_players;

/* using LIKE operator to find all school names that contain 'noi'*/
SELECT * FROM college.football_teams
WHERE school_name LIKE '%noi%';

/*using LIKE operator to find all conferences that have 'sour' in 4th thru 7th position*/ 
SELECT * FROM college.football_teams
WHERE conference LIKE '___sour%';

/* using IN operator to find all players that live in OR, WA, & CA*/
SELECT * FROM college.football_players
WHERE state IN ('OR', 'WA', 'CA');

/* using BETWEEN operator to find all all players and respective heights between 60 and 75*/
SELECT player_name, height FROM college.football_players
WHERE height BETWEEN 60 AND 75;

SET SQL_SAFE_UPDATES = 0;

UPDATE college.football_players
SET height = NULL WHERE id = 25;

/* finding null values in data*/
SELECT * FROM college.football_players 
WHERE height IS NULL;

/* using OR operator to find players that either weigh more than 300 or shorter than 70*/
SELECT * FROM college.football_players
WHERE weight > 300 OR height < 70;

/* using NOT operator to find all players not from Florida or New York*/
SELECT * FROM college.football_players
WHERE state NOT IN ('FL', 'NY');

/* finding tallest players */
SELECT * FROM college.football_players
ORDER BY height DESC;

/* finding unique number of conferences*/
SELECT COUNT(DISTINCT conference) FROM college.football_teams;

/*using GROUP BY clause to find avg weight for each school*/
SELECT full_school_name, AVG(weight) AS avg_weight FROM college.football_players
GROUP BY 1
ORDER BY 2;

/*correcting misspell in table*/
UPDATE college.football_players 
SET full_school_name = 'Illinois State Redbirds' WHERE full_school_name = 'Illinoise State Redbirds';

/* using HAVING clause to only include year and state of players with max height greater than 80*/
SELECT year,
       state,
       MAX(height) AS height
  FROM college.football_players
 GROUP BY year, state
HAVING MAX(height) > 80
 ORDER BY year, state;

/* defining a number of outcomes in a CASE statement*/
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 THEN '201-250'
            WHEN weight > 175 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM college.football_players;
  
  /*using INNER JOIN to find matches between two tables on like ID column*/
  SELECT p.* ,
       t.* 
  FROM college.football_players p
  JOIN college.football_teams t
    ON t.id = p.id;
    
INSERT INTO college.football_players VALUES ('Alabama Crimson Tide', 'Patrick Wright', 'RB', 69, 250, 'SR', 'IL', 26);

/* using LEFT JOIN to include all data from left table and only matches in right table*/
SELECT p.player_name, t.conference 
FROM college.football_players p 
LEFT JOIN college.football_teams t
ON p.id = t.id;

/* not using right join as good practice to stay consistent with just using left joins*/

/* using UNION ALL to stack one table on top of another*/ 
SELECT full_school_name, player_name, id
FROM college.football_players
UNION ALL
SELECT division, conference, id 
FROM college.football_teams;

