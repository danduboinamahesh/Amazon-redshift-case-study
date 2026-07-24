-- ==========================================================
-- Project : Amazon Redshift Customer Orders Analytics
-- File    : 05_data_transformation.sql
-- Purpose : Apply Data Transformations and Load Data Mart Tables
-- ==========================================================

------------------------------------------------------------
-- Load Cleaned Customer Data
------------------------------------------------------------

INSERT INTO dim_customers
(
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    gender,
    city,
    state,
    country,
    registration_date,
    customer_status
)

SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(email, 'unknown@example.com') AS email,
    phone,
    gender,
    city,
    COALESCE(state, 'UNKNOWN') AS state,
    country,
    registration_date,
    customer_status
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY customer_id
               ORDER BY registration_date DESC
           ) AS rn
    FROM stg_customers
) c
WHERE rn = 1;

------------------------------------------------------------
-- Load Cleaned Orders Data
------------------------------------------------------------

INSERT INTO fact_orders
(
    order_id,
    customer_id,
    order_date,
    product_id,
    product_category,
    quantity,
    unit_price,
    discount,
    tax,
    shipping_cost,
    order_amount,
    payment_method,
    order_status,
    sales_region
)

SELECT
    order_id,
    customer_id,
    order_date,
    product_id,
    product_category,
    quantity,
    unit_price,
    discount,
    tax,
    shipping_cost,
    COALESCE(order_amount,0) AS order_amount,
    payment_method,
    order_status,
    sales_region
FROM
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY order_id
               ORDER BY order_date DESC
           ) AS rn
    FROM stg_orders
) o
WHERE rn = 1;


