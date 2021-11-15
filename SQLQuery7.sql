SELECT 
	ride_id, 
	COUNT(ride_id) AS duplicated, 
	start_station_name, 
	end_station_name
FROM 
	trip
GROUP BY 
	ride_id, 
	start_station_name, 
	end_station_name
HAVING 
	COUNT(ride_id) > 1

-- Remove duplicated rows
select ride_id, start_station_name, end_station_name, ROW_NUMBER() over(partition by ride_id, start_station_name, end_station_name order by ride_id, start_station_name, end_station_name) rn
from trip

WITH CTE AS
(SELECT ride_id, start_station_name, end_station_name, 
ROW_NUMBER() over(partition by ride_id, start_station_name, end_station_name order by ride_id, start_station_name, end_station_name) rn
from trip)
DELETE FROM CTE WHERE rn > 1
-- Filter rows are Null, and then delete
select * from trip
where start_station_name is null and start_station_id is null and end_station_name is null and end_station_id is null

delete from trip
where start_station_name is null and start_station_id is null and end_station_name is null and end_station_id is null



SELECT * INTO trip_data_clean FROM (
	SELECT
		DISTINCT ride_id,           -- Filter unique rows
		member_casual AS user_type, -- Change confused column name
		rideable_type AS bike_type, -- Change confused column name
		start_station_name,
		end_station_name,
		started_at,
		ended_at,
		DATEDIFF(minute, started_at, ended_at) AS ride_length,
		DATEPART(WEEKDAY, started_at) AS week_day
	FROM
		trip
	WHERE
			(start_station_name IS NOT NULL   -- Filter NULL
			AND end_station_name IS NOT NULL)
		AND
			(start_station_name != '' and end_station_name != '')  -- Filter inconsistent string format
		
		AND
			(Cast(ended_at AS datetime) - Cast(started_at AS datetime) > 0)  -- Filter inconsistent date format
		AND
			DATEDIFF(second, started_at, ended_at) < 86400
		AND 
			DATEDIFF(second, started_at, ended_at) > 59
) as temp

SELECT * FROM trip_data_clean
order by ride_length, week_day

drop table trip_data_clean

CREATE TABLE trip_data
AS
SELECT *
  FROM trip_data_clean
 WHERE 1=0