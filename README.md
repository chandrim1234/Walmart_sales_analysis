![image](https://github.com/user-attachments/assets/18c2cbed-3dde-4e26-b9da-7f53c308c0f9)

# Walmart Sales Data Analysis

Project Overview :-

This project analyzes Walmart Sales data to gain insights into:

* Top-performing branches and products.

* Sales trends across different product categories.

* Customer behavior and preferences.

The goal is to identify factors influencing sales performance and provide actionable recommendations for optimizing sales strategies. The dataset is sourced from the Kaggle Walmart Sales Forecasting Competition.

Data Set Description :-

The dataset contains historical sales data for 45 Walmart stores across various regions, including markdown events during holidays that affect sales trends. The analysis focuses on three branches located in Mandalay, Yangon, and Naypyitaw. The dataset includes 17 columns and 1,000 rows:

| Column                  | Description                        | Data Type        |
|-------------------------|------------------------------------|------------------|
| invoice_id             | Invoice of the sales made          | VARCHAR(30)      |
| branch                 | Branch at which sales were made    | VARCHAR(5)       |
| city                   | The location of the branch         | VARCHAR(30)      |
| customer_type          | The type of the customer           | VARCHAR(30)      |
| gender                 | Gender of the customer making purchase | VARCHAR(10) |
| product_line           | Product line of the product sold   | VARCHAR(100)     |
| unit_price             | The price of each product          | DECIMAL(10, 2)   |
| quantity               | The amount of the product sold     | INT              |
| VAT                    | The amount of tax on the purchase  | DECIMAL(6, 4)      |
| total                  | The total cost of the purchase     | DECIMAL(10, 2)   |
| date                   | The date on which the purchase was made | DATE         |
| time                   | The time at which the purchase was made | TIMESTAMP   |
| payment_method         | The total amount paid              | DECIMAL(10, 2)   |
| cogs                   | Cost Of Goods sold                 | DECIMAL(10, 2)   |
| gross_margin_percentage| Gross margin percentage            | DECIMAL(11, 9)     |
| gross_income           | Gross Income                       | DECIMAL(10, 2)   |
| rating                 | Rating                             | DECIMAL(2, 1)      |



# Analysis Objectives :-

1. Product Analysis

* Identify top-performing product lines.

* Analyze product lines requiring improvement.

2. Sales Analysis

* Examine sales trends by product category and branch.

* Measure the effectiveness of sales strategies.

3. Customer Analysis

* Segment customers and analyze purchasing trends.

* Assess the profitability of different customer segments.

## Approach To The Project

1. Data Wrangling

* Handle NULL or missing values by setting NOT NULL constraints during table creation.

* Replace missing data where applicable.

2. Feature Engineering

* Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

* Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

* Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

3. Exploratory Data Analysis (EDA)

* Analyze sales, revenue, and customer trends.

* Answer specific business questions to support     decision-making.
## Business Questions Addressed
1. Generic Question
* How many unique cities are there in the sales data have?
* In which city is each branch?
2. Product
*	How many unique product lines does the data have?
*	What is the most common payment method?
*	Fetch some most selling product lines?
*	Fetch total revenue by month?
*	Fetch months along with their COGS?
*	Which product line has the largest revenue?
*	What city and branch has the largest revenue?
*	Which product line has the largest VAT?
*	Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
*	Which branch sold more products than average product sold?
*	Which is the most common product line by gender?
*	What is the average rating of each product line?

3. Sales
*	Number of sales made in each time of the day per weekday?
*	Which of the customer types brings the most revenue?
*	Which city has the largest tax percent/ VAT (Value Added Tax)?
*	Which customer type pays the most in VAT?

4. Customer
*	How many unique customer types does the data have?
*	How many unique payment methods does the data have?
*	How many unique customer types along with the count does the data have?
*	What is the gender of most of the customers?
*	What is the gender distribution per branch?
*	Which time of the day do customers give most ratings?
*	Which time of the day do customers give most ratings per branch?
*	Which day fo the week has the best avg ratings?
*	Which day of the week has the best average ratings per branch?

## Conclusion

This project provides valuable insights into Walmart's sales data, helping to identify trends, optimize strategies, and improve overall performance. Future work could focus on predictive modeling to forecast sales and identify potential areas for growth.
