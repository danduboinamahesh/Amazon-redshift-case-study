-- ==========================================================
-- Project : Amazon Redshift Customer Orders Analytics
-- File    : 06_analytical_queries.sql
-- Purpose : Business Analytics Queries
-- ==========================================================

------------------------------------------------------------
-- 1. Top 10 Customers by Revenue
------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(f.order_amount) AS revenue
FROM fact_orders f
JOIN dim_customers c
ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY revenue DESC
LIMIT 10;


------------------------------------------------------------
-- 2. Revenue by State
------------------------------------------------------------

SELECT
    c.state,
    SUM(f.order_amount) AS total_revenue
FROM fact_orders f
JOIN dim_customers c
ON f.customer_id = c.customer_id
GROUP BY c.state
ORDER BY total_revenue DESC;


------------------------------------------------------------
-- 3. Average Order Value by Customer
------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    AVG(f.order_amount) AS average_order_value
FROM fact_orders f
JOIN dim_customers c
ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY average_order_value DESC;


------------------------------------------------------------
-- 4. Customers with No Valid Email
------------------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM dim_customers
WHERE email = 'unknown@example.com';


------------------------------------------------------------
-- 5. Monthly Sales Trend
------------------------------------------------------------

SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(order_amount) AS total_sales
FROM fact_orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


------------------------------------------------------------
-- 6. Duplicate Detection Report
------------------------------------------------------------

-- Duplicate Customers

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM stg_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Duplicate Orders

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM stg_orders
GROUP BY order_id
HAVING COUNT(*) > 1;


------------------------------------------------------------
-- 7. Orders with Zero Amount After Cleansing
------------------------------------------------------------

SELECT *
FROM fact_orders
WHERE order_amount = 0;


------------------------------------------------------------
-- Bonus: Customer Summary
------------------------------------------------------------

-- SELECT
--     c.customer_id,
--     c.first_name,
--     c.last_name,
--     COUNT(f.order_id) AS total_orders,
--     SUM(f.order_amount) AS total_sales,
--     AVG(f.order_amount) AS average_order_value
-- FROM dim_customers c
-- LEFT JOIN fact_orders f
-- ON c.customer_id = f.customer_id
-- GROUP BY
--     c.customer_id,
--     c.first_name,
--     c.last_name
-- ORDER BY total_sales DESC;
