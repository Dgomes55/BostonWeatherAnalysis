SELECT DISTINCT
TRIM(CAST(wdate AS DATE)) AS full_date, #Shows the date without the time
YEAR(wdate) as years, #This seperates the year from the full date
MONTH(wdate) as months, #This seperates the month from the full date
DAY(wdate) as days, # This seperates the day from the full date
#End of Date Section

#Temperature Section
TRIM(FORMAT(((tavg * 9/5) + 32), 2)) AS temp_average_F, #The average air temperature in fahrenheit
FORMAT(((((tmax * 9/5) + 32) + ((tmin * 9/5) + 32)) / 2), 2)AS temp_avg_min_max, # This is me doing the average in fahrenheight by adding the min and the max temp for the day and diving it by 2 to get an average (which isnt the real way to get a average for weather but if something seems off its a good backup to have).
TRIM(FORMAT(((tmin * 9/5) + 32), 2)) AS temp_min_F, #The minimum air temperature in fahrenheit
TRIM(FORMAT(((tmax * 9/5) + 32), 2)) AS temp_max_F, # The maximum air temperature in fahrenheit

#End of Temp

TRIM(prcp) AS precipitation, #The daily precipitation total in millimeters, as a float
TRIM(wdir) AS wind_direction, #The average wind direction in degrees, as a float
CAST((0.621371 * wspd)AS DECIMAL(4,2)) AS wind_speed_MPH, #The average wind speed in MPH (Trying to stay on the trend of having both units)
TRIM(pres) AS sea_pressure #The average sea-level air pressure in hectopascals, as a float2

FROM boston_weather_data

WHERE MONTH(wdate) IN (12,1,2)
AND YEAR(wdate) IN (2014,2015,2016,2017,2018,2019,2020,2021,2022)