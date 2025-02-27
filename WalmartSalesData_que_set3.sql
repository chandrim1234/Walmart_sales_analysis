-- -----------------------------------------------CUSTOMER BASED QUESTIONS------------------------------------------------------------

1.	How many unique customer types does the data have?
SELECT DISTINCT (customer_type) as distinct_cutomer_type
FROM sales;

2.	How many unique payment methods does the data have?
SELECT DISTINCT (payment) as distinct_payment_method
FROM sales;

3.	How many unique customer types along with the count does the data have?
SELECT customer_type,
count(customer_type) AS common_cutomer_type
FROM sales
GROUP BY customer_type
ORDER BY common_cutomer_type DESC;

4.	What is the gender of most of the customers?
SELECT gender, COUNT(*) AS customer_count
FROM sales
GROUP BY gender
ORDER BY customer_count DESC
LIMIT 1;

5.	What is the gender distribution per branch?
SELECT branch, gender, COUNT(*) AS customer_count
FROM sales
GROUP BY branch, gender
ORDER BY branch, customer_count DESC;

6.	Which time of the day do customers give most ratings?
SELECT time_of_day, COUNT(rating) AS total_ratings
FROM sales
WHERE rating IS NOT NULL
GROUP BY time_of_day
ORDER BY total_ratings DESC
LIMIT 1;

7.	Which time of the day do customers give most ratings per branch?
SELECT branch,time_of_day, COUNT(rating) AS total_ratings
FROM sales
WHERE rating IS NOT NULL
GROUP BY branch,time_of_day
ORDER BY total_ratings DESC
LIMIT 1;

8.	Which day of the week has the best avg ratings?
SELECT day_name, ROUND(AVG(rating),2) AS avg_ratings
FROM sales
WHERE rating IS NOT NULL
GROUP BY day_name
ORDER BY avg_ratings DESC
LIMIT 1;

9.	Which day of the week has the best average ratings per branch?
SELECT branch, day_name, ROUND(AVG(rating),2) AS avg_ratings
FROM sales
WHERE rating IS NOT NULL
GROUP BY branch, day_name
ORDER BY avg_ratings DESC
LIMIT 1;