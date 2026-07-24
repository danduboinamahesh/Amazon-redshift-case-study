-- ==========================================================
-- Project : Amazon Redshift Customer Orders Analytics
-- File    : 02_copy_data.sql
-- Purpose : Load raw CSV data from Amazon S3 into staging tables
-- ==========================================================

-- ===========================================
-- Load Customers Data
-- ===========================================

COPY stg_customers
FROM 's3://customer-orders-analytics/customers_1000.csv'
IAM_ROLE 'arn:aws:iam::160184161839:role/RedshiftSpectrumRole'
FORMAT AS CSV
IGNOREHEADER 1
DATEFORMAT 'auto'
TIMEFORMAT 'auto'
EMPTYASNULL
BLANKSASNULL
TRIMBLANKS;

-- ===========================================
-- Load Orders Data
-- ===========================================

COPY stg_orders
FROM 's3://customer-orders-analytics/orders_5000.csv'
IAM_ROLE 'arn:aws:iam::160184161839:role/RedshiftSpectrumRole'
FORMAT AS CSV
IGNOREHEADER 1
DATEFORMAT 'auto'
TIMEFORMAT 'auto'
EMPTYASNULL
BLANKSASNULL
TRIMBLANKS;

-- ===========================================
-- Verify Data Load
-- ===========================================

SELECT COUNT(*) AS customer_records
FROM stg_customers;

SELECT COUNT(*) AS order_records
FROM stg_orders;

-- Preview Data

SELECT *
FROM stg_customers
LIMIT 10;

SELECT *
FROM stg_orders
LIMIT 10;
