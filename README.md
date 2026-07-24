# Amazon-redshift-case-study

## Project Overview

This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline using **Amazon Redshift**. The objective is to ingest customer and order data from Amazon S3, perform data cleansing and transformation, load the cleaned data into Data Mart tables, and generate business insights using SQL.

The project follows a typical Data Engineering workflow:

* Extract raw CSV files from Amazon S3
* Load raw data into Redshift staging tables
* Perform data quality checks
* Apply business transformations
* Load curated Dimension and Fact tables
* Generate analytical reports using SQL

---

# Problem Statement

A retail company receives **customers.csv** and **orders.csv** files containing duplicate records, missing values, and inconsistent data.

Build a Redshift ETL pipeline to:

* Ingest data from Amazon S3
* Load raw data into Redshift staging tables
* Clean and transform the data
* Load curated data into Data Mart tables
* Generate business insights using SQL

---

# Project Architecture

```text
                customers.csv
                orders.csv
                     │
                     ▼
                Amazon S3
                     │
                     ▼
             Redshift COPY Command
                     │
                     ▼
        Staging Tables (Raw Layer)
        ├── stg_customers
        └── stg_orders
                     │
                     ▼
         Data Quality Checks
                     │
                     ▼
      Data Transformation & Cleansing
                     │
                     ▼
        Data Mart Tables
        ├── dim_customers
        └── fact_orders
                     │
                     ▼
          Analytical SQL Queries
                     │
                     ▼
             Business Insights
```

---

# Technologies Used

* Amazon Web Services (AWS)
* Amazon Redshift
* Amazon S3
* IAM Roles
* SQL

---

# Dataset

## customers.csv

| Column            |
| ----------------- |
| customer_id       |
| first_name        |
| last_name         |
| email             |
| phone             |
| gender            |
| city              |
| state             |
| country           |
| registration_date |
| customer_status   |

---

## orders.csv

| Column           |
| ---------------- |
| order_id         |
| customer_id      |
| order_date       |
| product_id       |
| product_category |
| quantity         |
| unit_price       |
| discount         |
| tax              |
| shipping_cost    |
| order_amount     |
| payment_method   |
| order_status     |
| sales_region     |

---

# ETL Pipeline

## Step 1

Upload CSV files to Amazon S3.

---

## Step 2

Create Redshift staging tables.

* stg_customers
* stg_orders

---

## Step 3

Load CSV files into Redshift using the COPY command.

---

## Step 4

Perform Data Quality Checks.

* Duplicate customer records
* Duplicate order records
* Missing email values
* Missing state values
* Missing order_amount values

---

## Step 5

Create Data Mart tables.

* dim_customers
* fact_orders

---

## Step 6

Apply Data Transformations.

* Remove duplicate customers
* Remove duplicate orders
* Replace missing email with `unknown@example.com`
* Replace missing state with `UNKNOWN`
* Replace missing order_amount with `0`
* Load cleaned data into Data Mart tables

---

## Step 7

Run analytical SQL queries.

---

# Data Quality Issues

The following data quality issues were identified:

* Duplicate customer records
* Duplicate order records
* Missing email values
* Missing state values
* Missing order amount values

---

# Required Transformations

The following transformations were applied:

* Remove duplicate customers using `customer_id`
* Remove duplicate orders using `order_id`
* Replace missing email with `unknown@example.com`
* Replace missing state with `UNKNOWN`
* Replace missing order_amount with `0`
* Load cleaned data into curated tables

---

# Data Mart Design

## Dimension Table

### dim_customers

Contains customer information.

| Column            |
| ----------------- |
| customer_id       |
| first_name        |
| last_name         |
| email             |
| phone             |
| gender            |
| city              |
| state             |
| country           |
| registration_date |
| customer_status   |

---

## Fact Table

### fact_orders

Contains transactional order information.

| Column           |
| ---------------- |
| order_id         |
| customer_id      |
| order_date       |
| product_id       |
| product_category |
| quantity         |
| unit_price       |
| discount         |
| tax              |
| shipping_cost    |
| order_amount     |
| payment_method   |
| order_status     |
| sales_region     |

---

# Business Rules

* One customer per `customer_id`
* Revenue = `SUM(order_amount)`
* Average Order Value = `AVG(order_amount)`
* Top customers ranked by total revenue

---

# Analytical Queries

The following business reports were created:

1. Top 10 customers by revenue
2. Revenue by state
3. Average order value by customer
4. Customers with no valid email
5. Monthly sales trend
6. Duplicate detection report
7. Orders with zero amount after cleansing

---

# Project Structure

```text
Amazon-Redshift-Customer-Orders-Analytics/
│
├── dataset/
│   ├── customers.csv
│   └── orders.csv
│
├── sql/
│   ├── 01_create_staging_tables.sql
│   ├── 02_copy_data.sql
│   ├── 03_data_quality_checks.sql
│   ├── 04_create_datamart_tables.sql
│   ├── 05_data_transformation.sql
│   └── 06_analytical_queries.sql
│
│
└── README.md
```

---

# How to Execute

### 1. Upload CSV files to Amazon S3

Upload:

* customers.csv
* orders.csv

---

### 2. Create staging tables

Run:

```
01_create_staging_tables.sql
```

---

### 3. Load data into Redshift

Run:

```
02_copy_data.sql
```

---

### 4. Perform data quality checks

Run:

```
03_data_quality_checks.sql
```

---

### 5. Create Data Mart tables

Run:

```
04_create_datamart_tables.sql
```

---

### 6. Apply data transformations

Run:

```
05_data_transformation.sql
```

---

### 7. Generate business insights

Run:

```
06_analytical_queries.sql
```



---

# Learning Outcomes

Through this project, the following concepts were implemented:

* Amazon Redshift ETL Pipeline
* Amazon S3 Integration
* COPY Command
* Data Quality Validation
* Data Cleansing
* Dimension & Fact Table Design
* SQL Window Functions (`ROW_NUMBER`)
* SQL Aggregate Functions
* Business Analytics using SQL

---

# Future Enhancements

* Automate the ETL pipeline using AWS Glue or Apache Airflow
* Implement incremental data loading
* Optimize Redshift tables using Distribution Styles and Sort Keys
* Add logging and monitoring
* Create dashboards using Amazon QuickSight or Power BI

---

# Author

**Anubhav Shivhare**

B.Tech – Computer Science Engineering

Data Engineering | AWS | SQL | Amazon Redshift
