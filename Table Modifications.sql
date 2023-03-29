#Fixing any table issues due to imported data

#Creating a test table to ensure that this works before modifying our real data
CREATE TABLE test_weather AS SELECT * FROM boston_weather_data;

ALTER TABLE test_weather
#RENAME COLUMN time TO wdate,
#RENAME COLUMN pres TO sap,
MODIFY tavg DECIMAL(4,2),
MODIFY tmin DECIMAL(4,2),
MODIFY tmax DECIMAL(4,2),
MODIFY wdate DATE,
MODIFY prcp DECIMAL(4,2),
MODIFY wdir SMALLINT(3),
MODIFY wspd DECIMAL(4,2)

SELECT * FROM test_weather
SELECT * FROM boston_weather_data