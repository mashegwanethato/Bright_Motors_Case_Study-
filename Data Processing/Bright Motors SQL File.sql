-------------------------------------------------------------------------------------------------------
-- Exploratory Data Analysis
--Categorical Data
--Checking the full dataset
SELECT *
FROM casestudy3.carsales.carsalesanalysis
LIMIT 50;
-- Checking the different car makes
SELECT DISTINCT IFNULL(make,'Unknown') AS Make
FROM casestudy3.carsales.carsalesanalysis
LIMIT 50;
--Checking the different model types
SELECT DISTINCT IFNULL(model,'Unknown') AS Model
FROM casestudy3.carsales.carsalesanalysis
LIMIT 50;
-- Checking the different body types
SELECT DISTINCT IFNULL(body,'Unknown') AS Body
FROM casestudy3.carsales.carsalesanalysis
LIMIT 50;
--Checking the transmission types
SELECT DISTINCT IFNULL(transmission,'Unknown') AS Transmission
FROM casestudy3.carsales.carsalesanalysis

SELECT Distinct year
FROM casestudy3.carsales.carsalesanalysis
ORDER BY year DESC;

SELECT COUNT(year) AS NumberOfTransactions
FROM casestudy3.carsales.carsalesanalysis
LIMIT 50;


--Easy Access to the full table 
SELECT *
FROM casestudy3.carsales.carsalesanalysis;


-------------------------------------------------------------------------------------------------------

SELECT --Converting the Saledate date to a timestamp
       TO_TIMESTAMP(saledate, 'DY MON DD YYYY HH24:MI:SS') AS Timestamp,
       -- Making sure all the below columns don't return a NULL.
       IFNULL(make,'Make Unknown') AS Make,
       IFNULL(model,'Model Unknown') AS Model,
       IFNULL(body,'Body Unknown') AS Body,
       IFNULL(transmission,'Transmission Unknown') AS Transmission,
       IFNULL(color,'Color Unknown') AS Color,
       IFNULL(interior,'Interior Unknown') AS Interior,
       IFNULL(seller,'Seller Unknown') AS Seller,
       IFNULL(condition,0) AS Condition,
       IFNULL(mmr,0)  AS MarketValue,
       IFNULL(sellingprice,0)  AS SellingPrice,
       IFNULL(odometer,0)  AS Odometer,
       COUNT(year) AS UnitsSold,
       --Retrieving the Month Name
       MONTHNAME(timestamp) AS Name_of_Month,
       --Retrieving the Day Name
       DAYNAME(timestamp) AS Name_of_day,
       -- Getting the year of sale
       YEAR(timestamp) AS YearOfSale,
       -- This is the year the car way made
       year,
       -- Getting how old the car was when sold
       SUM(YearOfSale - year) AS YearsOfCar,
       -- Classifying the car based on year it was born
       CASE
            WHEN year BETWEEN 1980 AND 1999 THEN 'Vintage Car'   1980 - 1999  2000- 2010 >=2011
            WHEN year BETWEEN 2000 AND 2010 THEN 'Old Car'
            WHEN year >= 2011 THEN 'Fairly New Car'
        END AS VehicleClassification,
        --Calculating Revenue (With the assumption that every record = 1 sale)
       SUM(sellingprice) AS Revenue
FROM casestudy3.carsales.carsalesanalysis
GROUP BY ALL;

-------------------------------------------------------------------------------------------------------
