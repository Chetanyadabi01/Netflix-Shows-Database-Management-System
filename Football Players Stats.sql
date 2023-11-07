select Full_Name,Overall
FROM  stats
where Overall=91 ;

select *
from stats
where Full_Name like 'C%o'

select *
from stats
where age=(select min(age)
from stats);

SELECT * FROM stats WHERE National_Team_Name = 'Germany';

SELECT * FROM stats WHERE Release_Clause > 50000000;

SELECT Full_Name, Potential FROM stats ORDER BY Potential DESC LIMIT 20;

SELECT Nationality, AVG(Finishing) AS AverageFinishing FROM stats GROUP BY Nationality;

SELECT Club_Name, AVG(Overall) AS AverageOverall FROM stats GROUP BY Club_Name ORDER BY AverageOverall DESC;

SELECT Full_Name, (Finishing + Volleys + Long_Shots) AS ShootingAbility FROM stats ORDER BY ShootingAbility DESC LIMIT 10;

SELECT Full_Name, International_Reputation FROM stats WHERE International_Reputation = (SELECT MAX(International_Reputation) FROM stats);

SELECT Full_Name, Skill_Moves, Weak_Foot_Rating FROM stats ORDER BY Skill_Moves DESC, Weak_Foot_Rating DESC LIMIT 10;

SELECT Club_Name, AVG(Age) AS AverageAge FROM stats GROUP BY Club_Name;

SELECT Full_Name, TotalStats FROM stats WHERE TotalStats = (SELECT MAX(TotalStats) FROM stats);

SELECT Full_Name, (Dribbling + Agility) AS DribblingAbility FROM stats ORDER BY DribblingAbility DESC LIMIT 10;

SELECT Best_Position, AVG(Age) AS AverageAge FROM stats GROUP BY Best_Position;

SELECT Full_Name, Best_Position, TotalStats
FROM stats
WHERE (Best_Position, TotalStats) IN (
    SELECT Best_Position, MAX(TotalStats) AS MaxTotalStats
    FROM stats
    GROUP BY Best_Position
)
LIMIT 10;

SELECT Club_Name, AVG(Age) AS AverageAge
FROM stats
GROUP BY Club_Name
HAVING COUNT(Full_Name) > 5;

SELECT Full_Name, (Stamina + Strength) AS StaminaStrengthCombo
FROM stats
ORDER BY StaminaStrengthCombo DESC
LIMIT 10;

SELECT Preferred_Foot, AVG(Overall) AS AverageOverall
FROM stats
GROUP BY Preferred_Foot;

SELECT Full_Name, (Interceptions + Marking + Standing_Tackle + Sliding_Tackle) AS DefensiveStats
FROM stats
ORDER BY DefensiveStats DESC
LIMIT 10;

SELECT CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age >= 25 AND Age <= 30 THEN '25-30'
    ELSE '30+'
END AS Age_Group,
AVG(Overall) AS AverageOverall
FROM stats
GROUP BY Age_Group;

SELECT Club_Position, AVG(Overall) AS AverageOverall
FROM stats
WHERE Club_Position IS NOT NULL
GROUP BY Club_Position;

SELECT Club_Name, SUM(Release_Clause) AS TotalReleaseClauses
FROM stats
GROUP BY Club_Name
ORDER BY TotalReleaseClauses DESC;

SELECT Full_Name, (Pace_Total + Dribbling_Total) AS PaceDribbleCombo
FROM stats
ORDER BY PaceDribbleCombo DESC
LIMIT 10;

SELECT National_Team_Name, AVG(Overall) AS AverageOverall
FROM stats
WHERE National_Team_Name IS NOT NULL
GROUP BY National_Team_Name
ORDER BY AverageOverall DESC
LIMIT 1;

SELECT Full_Name, Best_Position, TotalStats
FROM stats
WHERE (Best_Position, TotalStats) IN (
    SELECT Best_Position, MAX(TotalStats) AS MaxTotalStats
    FROM stats
    GROUP BY Best_Position
)
AND Club_Position = Best_Position
LIMIT 10;

SELECT CASE
    WHEN Contract_Until = 1 THEN '1 year'
    WHEN Contract_Until = 2 THEN '2 years'
    -- Add more cases for different contract years as needed
    ELSE 'Other'
END AS Contract_Length,
AVG(Overall) AS AverageOverall
FROM stats
GROUP BY Contract_Length;

SELECT Preferred_Foot, Full_Name, TotalStats
FROM stats
WHERE (Preferred_Foot, TotalStats) IN (
    SELECT Preferred_Foot, MAX(TotalStats) AS MaxTotalStats
    FROM stats
    GROUP BY Preferred_Foot
);

SELECT CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age >= 25 AND Age <= 30 THEN '25-30'
    ELSE '30+'
END AS Age_Group,
Preferred_Foot,
AVG(Overall) AS AverageOverall
FROM stats
GROUP BY Age_Group, Preferred_Foot;

WITH ClubAvgOverall AS (
    SELECT Club_Name, AVG(Overall) AS AverageOverall
    FROM stats
    GROUP BY Club_Name
)
SELECT Full_Name, Club_Name, TotalStats
FROM stats
WHERE Club_Name IN (
    SELECT Club_Name
    FROM ClubAvgOverall
    WHERE AverageOverall = (SELECT MAX(AverageOverall) FROM ClubAvgOverall)
)
ORDER BY TotalStats DESC
LIMIT 10;

SELECT Full_Name, Attacking_Work_Rate, Defensive_Work_Rate
FROM stats
ORDER BY Attacking_Work_Rate DESC, Defensive_Work_Rate DESC
LIMIT 10;

SELECT Full_Name, (Passing_Total + Dribbling_Total) AS PassDribbleCombo
FROM stats
WHERE Best_Position IN ('CM', 'CAM', 'CDM')
ORDER BY PassDribbleCombo DESC
LIMIT 1;

SELECT CASE
    WHEN Contract_Until < 2 THEN '1 year or less'
    WHEN Contract_Until = 2 THEN '2 years'
    ELSE 'More than 2 years'
END AS Contract_Length,
AVG(Overall) AS AverageOverall
FROM stats
GROUP BY Contract_Length;

SELECT Full_Name, Freekick_Accuracy, Curve
FROM stats
ORDER BY Freekick_Accuracy DESC, Curve DESC
LIMIT 10;

SELECT CASE
    WHEN Strength < 70 THEN 'Weak'
    WHEN Strength >= 70 AND Strength <= 80 THEN 'Normal'
    ELSE 'Strong'
END AS Strength_Category,
AVG(Overall) AS AverageOverall
FROM stats
GROUP BY Strength_Category;




































