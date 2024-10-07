-- Count the number of athletes from each country --
SELECT Country, COUNT(*) AS TotalAthletes
FROM athletes
GROUP BY Country
ORDER BY TotalAthletes DESC;

-- Calculate total medals won by each country --
SELECT
TeamCountry,
SUM(Gold) Total_Gold,
SUM(Silver) Total_Silver,
SUM(Bronze) Total_Bronze
FROM medals
GROUP BY TeamCountry
ORDER BY Total_Gold DESC;

-- Calculate average enteries by gender in each discipline --
SELECT Discipline,
AVG(Female) Avg_Female,
AVG(Male) Avg_Male
FROM entriesgender
GROUP BY Discipline;

--  Find top 5 countries with the highest participation across all disciplines --
SELECT Country, COUNT(PersonName) AS TotalAthletes
FROM Athletes
GROUP BY Country
ORDER BY TotalAthletes DESC
LIMIT 5;

--  Find disciplines with a gender imbalance (where female or male participation exceeds by more than 20%) --
SELECT Discipline, Female, Male, 
       CASE 
           WHEN Female > Male THEN ((Female - Male) / Female) * 100
           ELSE ((Male - Female) / Male) * 100
       END AS ImbalancePercentage
FROM EntriesGender
WHERE ABS(Female - Male) / GREATEST(Female, Male) > 0.20
ORDER BY ImbalancePercentage DESC;

--  Find the average number of athletes per team for each discipline (for team-based sports) --
SELECT t.Discipline, AVG(a.AthleteCount) AS AvgAthletesPerTeam
FROM Teams t
JOIN (SELECT Country, Discipline, COUNT(PersonName) AS AthleteCount
      FROM Athletes
      GROUP BY Country, Discipline) a
ON t.Country = a.Country AND t.Discipline = a.Discipline
GROUP BY t.Discipline
ORDER BY AvgAthletesPerTeam DESC;

--  Find countries where more athletes participate in team-based events than individual events --
WITH TeamAthletes AS (
    SELECT t.Country, COUNT(DISTINCT a.PersonName) AS TeamAthletes
    FROM Teams t
    JOIN Athletes a ON t.Country = a.Country AND t.Discipline = a.Discipline
    GROUP BY t.Country
),
IndividualAthletes AS (
    SELECT a.Country, COUNT(a.PersonName) AS IndividualAthletes
    FROM Athletes a
    LEFT JOIN Teams t ON a.Country = t.Country AND a.Discipline = t.Discipline
    WHERE t.TeamName IS NULL
    GROUP BY a.Country
)
SELECT i.Country, TeamAthletes, IndividualAthletes
FROM TeamAthletes t
JOIN IndividualAthletes i ON t.Country = i.Country
WHERE TeamAthletes > IndividualAthletes
ORDER BY TeamAthletes DESC;
