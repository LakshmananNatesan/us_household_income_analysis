SELECT  State_Name,SUM(ALand),SUM(AWater)
FROM ushouseholdincome
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT  State_Name,SUM(ALand),SUM(AWater)
FROM ushouseholdincome
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;
-- so when you do right join or left join it has some missing columns so you have to 
-- check with the Govt, For the better use we will be doing inner join
SELECT i.State_Name,i.County,`Type`,`Primary`,Mean,Median
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics s on i.id = s.id
WHERE mean <> 0 ;

SELECT i.State_Name,ROUND(AVG(Mean),2),ROUND(AVG(Median),2)
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics s on i.id = s.id
WHERE MEAN <> 0
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Municipality has only one count in this record , so the average mean and median is quite high 
SELECT type,COUNT(Type),ROUND(AVG(Mean),2),ROUND(AVG(Median),2)
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics s on i.id = s.id
WHERE MEAN <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 3 DESC;

SELECT i.State_Name,City,ROUND(avg(mean),2) ,round(avg(median),2)
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics s on i.id = s.id
WHERE MEAN <> 0
GROUP BY 1,2
order by ROUND(avg(mean),2) DESC;

SELECT *
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics s on i.id = s.id ;

