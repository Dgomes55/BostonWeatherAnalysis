#This script is to clean the Boston Weather Data from Kaggle https://www.kaggle.com/datasets/swaroopmeher/boston-weather-2013-2023
#Note: The data was prechecked for duplicates and none exist but I included the Query I would use to remove duplicates see Remove_Dupe.SQL

#Selecting the needed columns from the data along with preforming any preprocessing to make the data consistent
SELECT CAST(time AS DATE) AS full_date, #Shows the date without the time
YEAR(time) as year_test, #This seperates the year from the full date
MONTH(time) as month_test, #This seperates the month from the full date
DAY(time) as day_test, # This seperates the day from the full date
#End of Date Section
#Temperature Section
((tavg * 9/5) + 32) AS temp_average, #The average air temperature in fahrenheit
((tmin * 9/5) + 32) AS temp_min, #The minimum air temperature in fahrenheit
((tmax * 9/5) + 32) AS temp_max, # The maximum air temperature in fahrenheit
#End of Temp
prcp AS precipitation, #The daily precipitation total in millimeters, as a float
wdir AS wind_direction, #The average wind direction in degrees, as a float
wspd AS wind_speed, #The average wind speed in kilometers per hour, as a float
pres AS sea_pressure #The average sea-level air pressure in hectopascals, as a float2

FROM boston_weather_data

WHERE MONTH(time) IN (12,1,2)
AND YEAR(time) IN (2020,2021,2022)