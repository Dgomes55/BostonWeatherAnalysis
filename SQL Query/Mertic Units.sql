
SELECT DISTINCT
TRIM(CAST(wdate AS DATE)) AS full_date, #Shows the date without the time
YEAR(wdate) as years, #This seperates the year from the full date
MONTH(wdate) as months, #This seperates the month from the full date
DAY(wdate) as days, # This seperates the day from the full date
#End of Date Section

#Temperature Section
((tmin + tmax) / 2) as temp_avg_min_max_c,
TRIM(tavg) as temp_average_C,
TRIM(tmin) as temp_min_C,
TRIM(tmax) as temp_max_C,

#End of Temp

TRIM(prcp) AS precipitation, #The daily precipitation total in millimeters, as a float
TRIM(wdir) AS wind_direction, #The average wind direction in degrees, as a float
TRIM(wspd) AS wind_speed_KM, #The average wind speed in kilometers per hour, as a float
TRIM(pres) AS sea_pressure #The average sea-level air pressure in hectopascals, as a float2

FROM boston_weather_data

WHERE MONTH(wdate) IN (12,1,2)
AND YEAR(wdate) IN (2014,2015,2016,2017,2018,2019,2020,2021,2022)