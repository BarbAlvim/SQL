-- GOOGLE CAPSTONE CYCLISTIC BIKE SHARE PROJECT 

-- Prepare Phase
SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
FROM `excel 2020 trips`;

-- Analyze Phase

-- Riders by member and casual users -- 
SELECT 
COUNT(ride_id) AS no_of_riders,
member_casual
FROM`excel 2020 trips`
GROUP BY
member_casual;

-- Rideable - type by members and casual riders 
SELECT 
COUNT(ride_id) AS no_of_riders,
rideable_type,
member_casual
FROM `excel 2020 trips`
GROUP BY
rideable_type,
member_casual
ORDER BY
COUNT(ride_id) DESC;

-- Mostly used start station by member and casual users
SELECT 
COUNT(ride_id) AS no_of_riders,
start_station_name,
member_casual
FROM `excel 2020 trips`
GROUP BY
start_station_name,
member_casual
ORDER BY
COUNT(ride_id) DESC;

-- Mostly used by end station by member and casual users 
SELECT 
COUNT(ride_id) AS no_of_riders,
end_station_name,
member_casual
FROM `excel 2020 trips`
GROUP BY
end_station_name,
member_casual
ORDER BY
COUNT(ride_id) DESC;

-- Started time by member and casual users
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART (MONTH) AS started_month,
DATEPART (WEEKDAY, started_at) AS started_day,
DATEPART ( HOUR, started_at) AS started_our,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (MONTH, started_at)
ORDER BY COUNT (ride_id) DESC;

-- Select time analylis by member and casual users
-- Month analysis
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART (MONTH,started_at) AS started_month,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (MONTH, started_at)
ORDER BY COUNT (ride_id) ;

-- Day analysis
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART (WEEKDAY, started_at) AS started_day,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (WEEKDAY, started_at)
ORDER BY COUNT (ride_id) DESC;

-- Hour analysis
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART ( HOUR, started_at) AS started_hour,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (HOUR, started_at)
ORDER BY COUNT (ride_id) DESC;

-- Ended time analysis by member and casual users
-- Month analysis
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART (MONTH, ended_at) AS ended_month,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (MONTH, ended_at)
ORDER BY COUNT (ride_id) ;

-- Day analysis
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART (WEEKDAY, ended_at) AS ended_day,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (WEEKDAY, ended_at)
ORDER BY COUNT (ride_id) DESC;

-- Hour analysis
SELECT 
COUNT(ride_id) AS no_of_riders,
DATEPART ( HOUR, ended_at) AS ended_hour,
member_casual
FROM `excel 2020 trips`
GROUP BY member_casual,
DATEPART (HOUR, ended_at)
ORDER BY COUNT (ride_id) DESC;


