-- -------------------------------------------GENERIC BASED QUESTIONS------------------------------------------------------------
1.	How many unique cities does the data have?
SELECT DISTINCT city 
FROM sales;

2.	In which city is each branch?
SELECT DISTINCT city , branch
FROM sales;

-- -------------------------------------------PRODUCT BASED QUESTIONS-------------------------------------------------------------
1.	How many unique product lines does the data have?
SELECT DISTINCT product_line
FROM sales;

2.	What is the most common payment method?
SELECT
    payment,
    COUNT(payment) AS payment_count
FROM sales
GROUP BY payment
ORDER BY payment_count DESC
LIMIT 1;

3. Fetch some of most selling product lines?
SELECT 
    product_line,
    SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_line
ORDER BY total_quantity_sold DESC;

4.	Fetch total revenue by month?
SELECT 
    month_name as month,
    SUM(Total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

5.	Fetch months along with their COGS?
SELECT 
    month_name as month,
    SUM(cogs) AS max_cogs
FROM sales
GROUP BY month_name 
ORDER BY max_cogs DESC;

6.	Which product line has the largest revenue? 
SELECT product_line, round(sum(total),2) AS most_selling_productline
FROM sales
GROUP BY product_line
ORDER BY most_selling_productline DESC
LIMIT 1;

7.	Which city and branch has the largest revenue?
SELECT branch, city,
 round(sum(total),2) AS most_selling_city
FROM sales
GROUP BY branch, city
ORDER BY most_selling_city DESC
LIMIT 1;

8.	Which product line has the largest VAT?
SELECT 
    product_line,
    ROUND(SUM(quantity * unit_price * (tax_pct / 100)), 2) AS total_vat
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC
LIMIT 1;

9.	Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT 
    product_line,
    SUM(quantity) AS total_sales,
    CASE
        WHEN SUM(quantity) > (
            SELECT AVG(total_quantity)
            FROM (
                SELECT SUM(quantity) AS total_quantity
                FROM sales
                GROUP BY product_line
            ) AS avg_sales
        ) THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM sales
GROUP BY product_line;

10.	Which branch sold more products than average product sold?
SELECT 
    branch, 
    SUM(quantity) AS qnty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (
    SELECT AVG(branch_total)
    FROM (
        SELECT SUM(quantity) AS branch_total
        FROM sales
        GROUP BY branch
    ) AS branch_totals
);

11.	Which is the most common product line by gender?
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

12.	What is the average rating of each product line?
SELECT
    product_line,
    ROUND(AVG(rating),2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating ;