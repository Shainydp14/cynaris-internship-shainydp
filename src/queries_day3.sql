
-- TASK 1: 8 Aggregate Queries using COUNT, SUM, AVG, MAX, MIN

-- 1. Total number of transactions (COUNT)
SELECT COUNT(transaction_id) AS total_transactions 
FROM sales;

-- 2. Total unique customers who made a purchase (COUNT DISTINCT)
SELECT COUNT(DISTINCT customer_id) AS unique_customers 
FROM sales;

-- 3. Total revenue generated (SUM)
SELECT SUM(sales_amount) AS total_revenue 
FROM sales;

-- 4. Total quantity of items sold (SUM)
SELECT SUM(quantity) AS total_items_sold 
FROM sales;

-- 5. Average order value (AVG)
SELECT AVG(sales_amount) AS average_order_value 
FROM sales;

-- 6. Average units sold per transaction (AVG)
SELECT AVG(quantity) AS average_units_per_order 
FROM sales;

-- 7. Highest single transaction value (MAX)
SELECT MAX(sales_amount) AS highest_sale 
FROM sales;

-- 8. Lowest single transaction value (MIN)
SELECT MIN(sales_amount) AS lowest_sale 
FROM sales;


-- TASK 2: Grouping by Region, Category, and Month
-- (Extracts month from sale_date; syntax may vary slightly depending on your SQL dialect like DATE_TRUNC or EXTRACT)
SELECT 
    region,
    category,
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    SUM(sales_amount) AS total_sales,
    COUNT(transaction_id) AS order_count
FROM sales
GROUP BY region, category, EXTRACT(MONTH FROM sale_date)
ORDER BY region, sale_month, total_sales DESC;


-- TASK 3: Filter aggregated results using HAVING
-- Finds regions and categories that generated more than $50,000 in total sales
SELECT 
    region,
    category,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region, category
HAVING SUM(sales_amount) > 50000;


-- TASK 4: Window function using SUM OVER()
-- Calculates running total revenue over time for each customer
SELECT 
    transaction_id,
    customer_id,
    sale_date,
    sales_amount,
    SUM(sales_amount) OVER(PARTITION BY customer_id ORDER BY sale_date) AS customer_running_total
FROM sales;
