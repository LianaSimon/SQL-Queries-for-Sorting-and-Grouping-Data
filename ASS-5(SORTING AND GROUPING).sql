CREATE DATABASE SORTING_GROUPING;
USE SORTING_GROUPING;

-- CREATE 'COUNTRY' TABLE
CREATE TABLE COUNTRY(
ID INT PRIMARY KEY,
COUNTRY_NAME VARCHAR(50),
POPULATION INT,
AREA FLOAT
);

-- CREATE 'PERSONS' TABLE
CREATE TABLE PERSONS(
ID INT PRIMARY KEY,
F_NAME VARCHAR(50),
L_NAME VARCHAR(50),
POPULATION INT,
RATING FLOAT,
COUNTRY_ID INT,
COUNTRY_NAME VARCHAR(50),
FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY(ID)
);




-- Insert data into Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331000000, 9834000),
(2, 'India', 1400000000, 3287000),
(3, 'China', 1440000000, 9597000),
(4, 'Brazil', 213000000, 8516000),
(5, 'Russia', 146000000, 17098200),
(6, 'Japan', 126000000, 377975),
(7, 'Germany', 83000000, 357386),
(8, 'UK', 67000000, 242495),
(9, 'France', 67000000, 551695),
(10, 'Australia', 25600000, 7692024);
SELECT*FROM COUNTRY;

-- Insert data into Persons table
INSERT INTO PERSONS(ID,F_NAME,L_NAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME)
VALUES
(1, 'John', 'Doe', 5000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 6000, 4.7, 1, 'USA'),
(3, 'Raj', 'Kumar', 7000, 4.9, 2, 'India'),
(4, 'Wei', 'Zhang', 5500, 4.6, 3, 'China'),
(5, 'Ana', 'Silva', 5000, 4.8, 4, 'Brazil'),
(6, 'Olga', 'Ivanova', 3000, 4.3, 5, 'Russia'),
(7, 'Taro', 'Yamamoto', 2000, 4.4, 6, 'Japan'),
(8, 'Hans', 'Müller', 2500, 4.2, 7, 'Germany'),
(9, 'Emma', 'Brown', 4000, 4.5, 8, 'UK'),
(10, 'Jean', 'Dupont', 3000, 4.1, 9, 'France');
SELECT * FROM PERSONS;

-- Queries
-- 1. Write an SQL query to print the first three characters of Country_name from the Country table. 
SELECT LEFT(COUNTRY_NAME,3) AS FIRST_3_CHARACTERS_OF_COUNTRIES FROM COUNTRY;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.
SELECT CONCAT(F_NAME," ",L_NAME) AS FULLNAME FROM PERSONS;

-- 3. Write an SQL query to count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT COUNTRY_NAME) AS UNIQUE_COUNTRYNAME_COUNT FROM PERSONS;

-- 4. Write a query to print the maximum population from the Country table.
SELECT MAX(POPULATION) AS MAXIMUM_POPULATION FROM COUNTRY;

-- 5. Write a query to print the minimum population from Persons table
SELECT MIN(POPULATION) AS MINIMUM_POPULATION FROM PERSONS;

-- Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
INSERT INTO PERSONS 
VALUES(11,'Dia',null,4000,3.5,2,'INDIA'),
(12,'Arhan',null,3500,3.2,3,'SRILANKA');
SELECT*FROM PERSONS;
SELECT COUNT(L_NAME) AS LASTNAME_COUNT FROM PERSONS;

-- 7. Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) AS ROWS_COUNT FROM PERSONS;

-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
SELECT POPULATION AS FIRST3COUNTRIES_POPULATION FROM COUNTRY LIMIT 3;

-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
SELECT * FROM COUNTRY ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order. 
SELECT * FROM PERSONS ORDER BY(RATING) DESC;

-- 11. Find the total population for each country in the Persons table.
SELECT COUNTRY_NAME,SUM(POPULATION) AS TOTAL_POPULATION FROM PERSONS GROUP BY COUNTRY_NAME;

-- 12. Find countries in the Persons table with a total population greater than 50,000
INSERT INTO PERSONS 
VALUES(13,'ANGELENE','LAS',60000,3.5,2,'BRAZIL'),
(14,'ZERENE','HEGDE',55000,3.2,3,'SRILANKA');
SELECT COUNTRY_NAME,SUM(POPULATION)  AS TOTAL_POPULATION FROM PERSONS GROUP BY COUNTRY_NAME HAVING SUM(POPULATION)>50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, 
--    ordered by the average rating in ascending order.

INSERT INTO PERSONS 
VALUES(15,'LOIUS','DON',56000,3.5,2,'USA'),
(16,'JUAN','RENN',3500,3.2,3,'BRAZIL');

SELECT COUNTRY_NAME,COUNT(*) AS TOTALPERSONS , AVG(RATING) AS AVERAGE_RATING 
FROM PERSONS
GROUP BY COUNTRY_NAME HAVING COUNT(*)>2
ORDER BY AVERAGE_RATING ASC;