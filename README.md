# 🛍️ Zepto E-commerce Inventory Analysis (SQL Project)
## 📖 About the Project

This repository contains a hands-on SQL-based data analysis project built using an e-commerce inventory dataset inspired by Zepto, one of India’s leading quick-commerce platforms. The project replicates how data and product analysts work with real, imperfect business data to extract actionable insights.

The emphasis is on end-to-end analytical thinking—from raw data ingestion to business-focused SQL analysis.

## 🎯 Who This Project Is For

📊 Data Analyst, Business Analyst, and Product Analyst aspirants

🧠 Learners practicing SQL on real-world datasets

💼 Candidates preparing for interviews in e-commerce, retail, or product roles

📁 Anyone building a strong analytics portfolio project

## 🧩 Problem Statement

1. E-commerce catalog data is often noisy and duplicated. This project simulates how analysts:

2. Work with SKU-level product data

3. Handle pricing inconsistencies and missing values

4. Analyze inventory availability

5. Convert raw tables into business insights using SQL

## 🗂️ Dataset Overview

The dataset represents product SKUs listed on Zepto, sourced from Kaggle and designed to reflect real-world inventory behavior.

Each row corresponds to a unique SKU, not a unique product. Multiple SKUs may exist for the same product name due to:

Different package sizes or weights

Discount variations

Category-level visibility strategies

## 🧾 Dataset Schema

The main columns used in the analysis include:

* sku_id - Unique identifier for each SKU

* name - Product name as shown on the app

* category - Product category (Fruits, Snacks, Beverages, etc.)

* mrp - Maximum Retail Price (originally in paise, converted to ₹)

* discountPercent - Discount applied on MRP

* discountedSellingPrice - Final selling price after discount (originally in paise, converted to ₹)

* availableQuantity - Units available in inventory

* weightInGms - Product weight in grams

* outOfStock - Boolean flag indicating stock availability 

* quantity - Units per package

## 🔄 Project Workflow

1️⃣ Database & Table Creation

A structured SQL table is created with appropriate data types, primary keys, and constraints to support accurate querying and analysis.

```sql
USE zepto_sql_project;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category varchar(120),
name varchar(120) NOT NULL,		
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
```

2️⃣ Data Import & Validation

* Imported CSV data into the database

* Resolved UTF-8 encoding issues

* Verified schema and column consistency post-import

3️⃣ Exploratory Data Analysis (EDA)

* Initial exploration included:

* Total SKU count

* Category-wise distribution

* Null value checks

* In-stock vs out-of-stock comparison

* Identification of duplicate product names across SKUs

4️⃣ Data Cleaning

Key cleaning steps performed:

1. Removed records with zero or invalid pricing

2. Standardized price units (paise to rupees)

3. Filtered inconsistent inventory records

5️⃣ Business-Oriented SQL Analysis

1. SQL queries were written to answer business questions such as:

2. Top products offering the highest discounts

3. High-MRP products currently out of stock

4. Category-wise potential revenue estimation

5. Expensive products with minimal discounts

6. Best value products using price-per-gram analysis

7. Inventory weight distribution across categories

📈 Key Insights

1. Identified best-value SKUs based on discount and price efficiency

2. Highlighted revenue-driving categories

3. Detected pricing and inventory gaps

4. Evaluated stock availability impact on premium products

🛠️ Tech Stack

* Database: MySQL

* Query Language: SQL

* Data Source: CSV (Excel format)

▶️ How to Run the Project

Clone the repository

Create a database in your SQL client

Run the SQL file to create tables and queries

Import the dataset (ensure UTF-8 encoding)

🚀 Future Enhancements

Python-based EDA and visualization

Category-level dashboards

Demand vs stock gap analysis

Pricing optimization use cases
