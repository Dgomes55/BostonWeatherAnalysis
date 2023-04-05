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
MODIFY wdir VARCHAR(10), #This is set as a varchar so we can clean the numbers to text to match the wind direction
MODIFY wspd DECIMAL(4,2)

DROP TABLE test_weather

#The code above is for a test table, this allows me to test any scirpts / commands with ensuring our main dataset stays safe.



#THE CODE STARTING FROM HERE MODIFIES THE MAIN DATA TABLE SO BECAREFUL AND ENSURE YOU HAVE A BACKUP.
#

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

#This is to update wdir to a VARCHAR for our new data then it will change all of the numbers to the proper wind direction.
# https://uni.edu/storm/Wind%20Direction%20slide.pdf is the link to the wind direction map used to make these changes.

ALTER TABLE boston_weather_data
MODIFY wdir VARCHAR(4);

#Becareful running this, as improper use could cause issues with your table.

UPDATE boston_weather_data
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