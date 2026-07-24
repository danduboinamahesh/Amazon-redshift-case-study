-- ==========================================================
-- Project : Amazon Redshift Customer Orders Analytics
-- File    : 04_create_datamart_tables.sql
-- Purpose : Create Data Mart Tables
-- ==========================================================

-- Drop tables if they already exist

DROP TABLE IF EXISTS fact_orders;
DROP TABLE IF EXISTS dim_customers;

------------------------------------------------------------
-- Create Customer Dimension Table
------------------------------------------------------------

CREATE TABLE dim_customers
(
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(20),
    gender VARCHAR(10),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    registration_date DATE,
    customer_status VARCHAR(20)
);

------------------------------------------------------------
-- Create Orders Fact Table
------------------------------------------------------------

CREATE TABLE fact_orders
(
    order_id INT,
    customer_id INT,
    order_date DATE,
    product_id INT,
    product_category VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(10,2),
    tax DECIMAL(10,2),
    shipping_cost DECIMAL(10,2),
    order_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    sales_region VARCHAR(100)
);
