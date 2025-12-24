# 🛍️ Zepto E-commerce Inventory Analysis (SQL Project)
## 📖 About the Project

This repository contains a hands-on SQL-based data analysis project built using an e-commerce inventory dataset inspired by Zepto, one of India’s leading quick-commerce platforms. The project replicates how data and product analysts work with real, imperfect business data to extract actionable insights.

The emphasis is on end-to-end analytical thinking—from raw data ingestion to business-focused SQL analysis.

🎯 Who This Project Is For

📊 Data Analyst, Business Analyst, and Product Analyst aspirants

🧠 Learners practicing SQL on real-world datasets

💼 Candidates preparing for interviews in e-commerce, retail, or product roles

📁 Anyone building a strong analytics portfolio project


## 🧩 Problem Statement

E-commerce catalog data is often noisy and duplicated. This project simulates how analysts:

Work with SKU-level product data

Handle pricing inconsistencies and missing values

Analyze inventory availability

Convert raw tables into business insights using SQL

## 🗂️ Dataset Overview

The dataset represents product SKUs listed on Zepto, sourced from Kaggle and designed to reflect real-world inventory behavior.

Each row corresponds to a unique SKU, not a unique product. Multiple SKUs may exist for the same product name due to:

Different package sizes or weights

Discount variations

Category-level visibility strategies

## 🧾 Dataset Schema

The main columns used in the analysis include:

sku_id - Unique identifier for each SKU

name - Product name as shown on the app

category - Product category (Fruits, Snacks, Beverages, etc.)

mrp - Maximum Retail Price (originally in paise, converted to ₹)

discountPercent - Discount applied on MRP

discountedSellingPrice - Final selling price after discount (originally in paise, converted to ₹)

availableQuantity - Units available in inventory

weightInGms - Product weight in grams

outOfStock - Boolean flag indicating stock availability 

quantity - Units per package

## 🔄 Project Workflow

1️⃣ Database & Table Creation

A structured SQL table is created with appropriate data types, primary keys, and constraints to support accurate querying and analysis.

2️⃣ Data Import & Validation

Imported CSV data into the database

Resolved UTF-8 encoding issues

Verified schema and column consistency post-import

3️⃣ Exploratory Data Analysis (EDA)

Initial exploration included:

Total SKU count

Category-wise distribution

Null value checks

In-stock vs out-of-stock comparison

Identification of duplicate product names across SKUs

4️⃣ Data Cleaning

Key cleaning steps performed:

Removed records with zero or invalid pricing

Standardized price units (paise to rupees)

Filtered inconsistent inventory records

5️⃣ Business-Oriented SQL Analysis

SQL queries were written to answer business questions such as:

Top products offering the highest discounts

High-MRP products currently out of stock

Category-wise potential revenue estimation

Expensive products with minimal discounts

Best value products using price-per-gram analysis

Inventory weight distribution across categories

📈 Key Insights

Identified best-value SKUs based on discount and price efficiency

Highlighted revenue-driving categories

Detected pricing and inventory gaps

Evaluated stock availability impact on premium products

🛠️ Tech Stack

Database: PostgreSQL / MySQL

Query Language: SQL

Data Source: CSV (Excel format)

Tools: pgAdmin / MySQL Workbench

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
