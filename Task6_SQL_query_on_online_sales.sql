-- TASK 6 of Data Analyst Internship at ELEVATE LABS

CREATE TABLE online_sales (
    order_id VARCHAR(255),
    order_date DATE,
    product_id VARCHAR(255),
    amount DECIMAL(10,2)
);

SELECT COUNT(*) FROM online_sales;

-- Convert order_date to DATE properly

UPDATE online_sales
SET order_date = STR_TO_DATE(order_date, '%Y-%m-%d');

-- change the column type to DATE:

ALTER TABLE online_sales
MODIFY COLUMN order_date DATE;

SELECT * FROM online_sales LIMIT 5;

SELECT COUNT(*) FROM online_sales;

SELECT DISTINCT order_date FROM online_sales ORDER BY order_date DESC LIMIT 5;

-- Final query to get order volume , monthly revenue 

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS year_months,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    year_months
ORDER BY 
    year_months;

SELECT * FROM online_sales;
