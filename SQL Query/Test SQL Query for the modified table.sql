#This script is to clean the Boston Weather Data from Kaggle https://www.kaggle.com/datasets/swaroopmeher/boston-weather-2013-2023
#Note: The data was prechecked for duplicates and none exist but I included the Query I would use to remove duplicates see Remove_Dupe.SQL

#Selecting the needed columns from the data along with preforming any preprocessing to make the data consistent


# THIS WAS TESTED ON A TEST TABLE FIRST TO ENSURE NO DATA LOSS ON MAIN TABLE
# THIS WILL BE PUT INTO THE TABLE MODIFICATIONS SCRIPT FOR BOSTON_WEATHER_DATA TO ENSURE THAT IT IS NOT RAN MULTIPLE TIMES
UPDATE test_weather
	SET wdir = CASE
	WHEN wdir BETWEEN 350 AND 360 THEN 'N'
	WHEN wdir BETWEEN 0 AND 19 THEN 'N'
    WHEN wdir BETWEEN 20 AND 39 THEN 'N/NE'
    WHEN wdir BETWEEN 40 AND 59 THEN 'NE'
    WHEN wdir BETWEEN 60 AND 79 THEN 'E/NE'
    WHEN wdir BETWEEN 80 AND 109 THEN 'E'
    WHEN wdir BETWEEN 110 AND 129 THEN 'E/SE'
    WHEN wdir BETWEEN 130 AND 149 THEN 'SE'
    WHEN wdir BETWEEN 150 AND 169 THEN 'S/SE'
    WHEN wdir BETWEEN 170 AND 199 THEN 'S'
    WHEN wdir BETWEEN 200 AND 219 THEN 'S/SW'
    WHEN wdir BETWEEN 220 AND 239 THEN 'SW'
    WHEN wdir BETWEEN 240 AND 259 THEN 'W/SW'
    WHEN wdir BETWEEN 260 AND 289 THEN 'W'
    WHEN wdir BETWEEN 290 AND 309 THEN 'W/NW'
    WHEN wdir BETWEEN 310 AND 329 THEN 'NW'
    WHEN wdir BETWEEN 330 AND 340 THEN 'N/NW'
    END;

##END OF TESTING


SELECT DISTINCT
TRIM(CAST(wdate AS DATE)) AS full_date, #Shows the date without the time
YEAR(wdate) as year_test, #This seperates the year from the full date
MONTH(wdate) as month_test, #This seperates the month from the full date
DAY(wdate) as day_test, # This seperates the day from the full date
#End of Date Section

#Temperature Section
TRIM(FORMAT(((tavg * 9/5) + 32), 2)) AS temp_average, #The average air temperature in fahrenheit
TRIM(FORMAT(((tmin * 9/5) + 32), 2)) AS temp_min, #The minimum air temperature in fahrenheit
TRIM(FORMAT(((tmax * 9/5) + 32), 2)) AS temp_max, # The maximum air temperature in fahrenheit
FORMAT(((((tmax * 9/5) + 32) + ((tmin * 9/5) + 32)) / 2), 2)AS temp_avg_min_max, # Might be useful not really sure yet (do more research before using these numbers in analysis.
#End of Temp

TRIM(prcp) AS precipitation, #The daily precipitation total in millimeters, as a float
TRIM(wdir) AS wind_direction, #The average wind direction in degrees, as a float
TRIM(wspd) AS wind_speed, #The average wind speed in kilometers per hour, as a float
TRIM(sap) AS sea_pressure #The average sea-level air pressure in hectopascals, as a float2

#IF(wdir BETWEEN 330 AND 340, 'N/NW', wdir) OR
#(wdir BETWEEN 310 AND 320, 'NW', wdir END)

FROM test_weather

WHERE MONTH(wdate) IN (12,1,2)
AND YEAR(wdate) IN (2014,2015,2016,2017,2018,2019,2020,2021,2022)