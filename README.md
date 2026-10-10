# Retail Sales SQL Analysis

## Project Overview

This project focuses on analyzing retail sales data using SQL in PostgreSQL. The goal is to explore customer activity, order patterns, product category performance, and payment trends to identify useful business insights and support data-driven decisions.

## Business Objectives

- Analyze customer and order activity.
- Identify the highest- and lowest-revenue product categories.
- Examine payment trends across different years.
- Investigate payment statuses, including pending and refunded transactions.
- Use SQL queries to answer business questions and identify opportunities for improvement.

## Tools Used

- **Database:** PostgreSQL
- **Query Language:** SQL
- **Project Documentation:** Markdown
- **Version Control and Project Hosting:** GitHub

## SQL Skills Demonstrated

- Filtering and sorting data using `WHERE` and `ORDER BY`
- Summarizing data using `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- Grouping data using `GROUP BY` and filtering grouped results using `HAVING`
- Combining tables using `INNER JOIN` and `LEFT JOIN`
- Using subqueries to answer business questions
- Identifying customers who have never placed an order
- Analyzing revenue by product category and payment trends by year

## Key Findings

- **Electronics** generated the highest category revenue, totaling ₦1,120,734,000.
- **Furniture** ranked second, generating ₦716,640,000.
- **Software** generated ₦538,155,000.
- **Stationery** recorded the lowest category revenue at ₦28,810,000.
- Payment totals differed between 2025 and 2026, while average payment amounts were similar. The 2026 figures should be interpreted cautiously if the dataset does not cover the full year.

## Business Recommendations

- Investigate the products contributing most to Electronics revenue and monitor their availability.
- Examine the performance of Furniture and Software to identify opportunities for growth.
- Investigate the factors behind Stationery's lower revenue before making pricing, marketing, or inventory decisions.
- Monitor pending and refunded payments to identify potential payment-processing or customer-service issues.

## Project Files

- **`retail_sales_queries.sql`** — Contains the SQL queries used to answer the business questions.
- **Dataset file** — Contains the retail sales data used for the analysis. The exact filename and format are shown in the repository.
- **`business_insights.md`** — Presents the key findings, their business implications, and recommendations.

## Conclusion

This project demonstrates the use of SQL to explore retail sales data, summarize business performance, and derive insights from multiple related tables. The analysis highlights differences in product category revenue and payment activity, providing a foundation for further investigation and data-informed business decisions.
