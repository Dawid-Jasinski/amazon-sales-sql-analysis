# Amazon Sales – SQL Data Analysis Project

This repository presents an end-to-end SQL analytics project based on Amazon e-commerce sales data (2022–2023). The goal of the project was to perform a comprehensive business-oriented analysis, develop a normalized relational database model, implement analytical SQL solutions, and produce a full corporate-style report describing insights, trends and strategic recommendations.

The project follows a consulting-style analytical workflow:  
**(1) business problem → (2) data preparation → (3) SQL modeling → (4) analytical queries → (5) KPIs & insights → (6) final report.**

---

## 📊 Project Scope

The project includes:

### **1. Database Normalization**
The raw CSV dataset was imported into SQL Server and transformed into a 3‑table relational model:
- **Orders**
- **Products**
- **Order_Items**

Normalization improved data quality, removed redundancy and enabled clean analytical processing.

### **2. SQL Analytical Work**
A full suite of SQL analysis was completed:
- category-level revenue analysis  
- regional sales performance  
- monthly seasonality trends  
- discount efficiency analysis  
- KPI computation (total revenue, order count, AOV, items per order)

Additional SQL assets include:
- analytical views (`VIEW`)
- business logic encapsulated in stored procedures (`PROC`)
- JOIN-based analytical examples
- supporting scripts for data loading and design structure

### **3. Business Report (PDF)**
A 10–15 page corporate-style analytical report was prepared, including:
- executive summary  
- methodology  
- category analysis  
- regional analysis  
- seasonality analysis  
- discount performance evaluation  
- KPI interpretation  
- strategic business recommendations  

The report is written in a consulting tone and mirrors professional deliverables used by analytics teams.

---

## 📁 Repository Structure

```
/sql
   01_basic_queries.sql
   02_analysis_queries.sql
   03_views.sql
   04_procedures.sql

/database_design
   tables_normalized.sql
   joins_examples.sql
   erd.txt

/data
   amazon_sales_dataset.csv

/report
   Amazon_Sales_SQL_Report [PL].pdf
   Amazon_Sales_SQL_Report [ENG].pdf
```

---

## 🧠 Key Insights from the Analysis

The project revealed several important business observations:

- Sales across product categories are highly balanced; **Beauty** performs slightly strongest.
- Revenue across regions is also evenly distributed, with **Middle East** leading marginally.
- Monthly sales show moderate seasonality, with **January 2023** as the strongest month and **February 2023** as the weakest.
- High discounts (20–30%) reduce revenue and average order value; the most effective range is **0–5%**.
- The platform shows stable KPIs: **32.87M total revenue**, **50,000 orders**, **AOV ≈ 657**, **avg. quantity = 2**.

These insights form the basis for the strategic recommendations detailed in the report.

---

## 🧭 Objectives of This Project

The project demonstrates practical skills relevant to a Junior Data Analyst role:

- SQL data modeling  
- advanced analytical querying  
- database normalization  
- business-driven interpretation of results  
- structured reporting  
- preparing deliverables following consulting standards  

---

## 📘 Final Notes

This repository serves as a complete analytical case study showcasing SQL proficiency, business understanding, and the ability to communicate insights in a professional corporate format.
