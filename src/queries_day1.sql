-- WHERE with AND: Find high-value electronics sales
SELECT order_id, customer_id, product_category, total_amount 
FROM sales 
WHERE product_category = 'Electronics' AND total_amount > 500;

-- WHERE with OR: Find sales from specific regional hubs
SELECT order_id, region, total_amount 
FROM sales 
WHERE region = 'North' OR region = 'West';

--  WHERE with NOT: Find all sales except canceled orders
SELECT order_id, order_status, total_amount 
FROM sales 
WHERE NOT order_status = 'Canceled';

-- LIKE operator: Find customers with names starting with 'J'
SELECT customer_id, customer_name, email 
FROM customers 
WHERE customer_name LIKE 'J%';

-- LIKE operator: Find emails ending in corporate domains
SELECT customer_id, customer_name, email 
FROM customers 
WHERE email LIKE '%@cynaris.com';

-- IN operator: Filter orders by top performing categories
SELECT order_id, product_category, total_amount 
FROM sales 
WHERE product_category IN ('Electronics', 'Clothing', 'Home');

-- NOT IN operator: Exclude minor regions
SELECT order_id, region, total_amount 
FROM sales 
WHERE region NOT IN ('South-West', 'North-East');

-- BETWEEN operator: Find sales within Q1
SELECT order_id, order_date, total_amount 
FROM sales 
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31';

-- BETWEEN operator: Find mid-range price items
SELECT order_id, unit_price 
FROM sales 
WHERE unit_price BETWEEN 50 AND 150;

-- IS NULL operator: Find orders missing shipping details
SELECT order_id, customer_id, shipping_date 
FROM sales 
WHERE shipping_date IS NULL;
