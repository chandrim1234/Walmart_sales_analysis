-- -------------------------------------------------SALES BASED QUESTIONS------------------------------------------------------------
1.	Number of sales made in each time of the day per weekday?
SELECT
	time_of_day,
	COUNT(total) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;

2.	Which of the customer types brings the most revenue?
SELECT
	customer_type,
	sum(total) AS customer_type_sales
FROM sales
GROUP BY customer_type
ORDER BY customer_type_sales DESC;

3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT 
    city,
    ROUND(SUM(quantity * unit_price * (tax_pct / 100)), 2) AS total_vat
FROM sales
GROUP BY city
ORDER BY total_vat DESC
LIMIT 1;

4.	Which customer type pays the most in VAT?
SELECT
	customer_type,
    ROUND(SUM(quantity * unit_price * (tax_pct / 100)), 2) AS total_vat
FROM sales
GROUP BY customer_type
ORDER BY total_vat DESC
LIMIT 1;
	