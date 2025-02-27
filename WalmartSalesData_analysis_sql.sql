--------------------------------------------- CREATE DATABASE---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS walmartsales;
USE  walmartsales;

--------------------------------------------- CREATE TABLE---------------------------------------------------------

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct DECIMAL(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct DECIMAL(11,9),
    gross_income DECIMAL(12, 4),
    rating DECIMAL(2, 1)
);

--------------------------------------------- FEATURE ENGINEERING ---------------------------------------------------------

*************************************************** NOTE *************************************************************
-- There are 2 ways for performing DATA ENGINEERING and they are as follows :-
-- 1) For this to work turn off safe mode for update:
		-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
		-- Reconnect to MySQL: Query > Reconnect to server

-- 2) For this to work turn off safe mode for update:
		-- The following query helps to disable safe update mode for the session -
		-- SET SQL_SAFE_UPDATES = 0;
		-- After running the update query, one can re-enable safe update mode if needed using the following query -
		-- SET SQL_SAFE_UPDATES = 1;

**********************************************************************************************************************
-- 1) Add the time_of_day column
SELECT time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- 2) Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- 3) Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

SET SQL_SAFE_UPDATES = 1;

