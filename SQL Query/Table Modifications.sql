#Fixing any table issues due to imported data

#Creating a test table to ensure that this works before modifying our real data
CREATE TABLE test_weather AS SELECT * FROM boston_weather_data;

ALTER TABLE test_weather
#The two rename functions have to be ran seperately and ran first or else it will cause errors and not work properly.
#RENAME COLUMN time TO wdate; 
#RENAME COLUMN pres TO sap;
MODIFY tavg DECIMAL(4,2),
MODIFY tmin DECIMAL(4,2),
MODIFY tmax DECIMAL(4,2),
MODIFY wdate DATE,
MODIFY prcp DECIMAL(4,2),
MODIFY wdir SMALLINT(3),
MODIFY wspd DECIMAL(4,2)

DROP TABLE test_weather

#The code above is for a test table, once the test table is confirmed to work the way we want it gets dropped

#THE CODE STARTING FROM HERE MODIFIES THE MAIN DATA TABLE SO BECAREFUL AND ENSURE YOU HAVE A BACKUP.

ALTER TABLE boston_weather_data
#The line below is commented out for the same reason as the test dataset
#RENAME COLUMN time TO wdate;
MODIFY tavg DECIMAL(4,2),
MODIFY tmin DECIMAL(4,2),
MODIFY tmax DECIMAL(4,2),
MODIFY wdate DATE,
MODIFY prcp DECIMAL(4,2),
MODIFY wdir SMALLINT(3),
MODIFY wspd DECIMAL(4,2)