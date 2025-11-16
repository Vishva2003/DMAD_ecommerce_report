# E-Commerce Database Project

## Overview

This project presents a fully designed and implemented **E-Commerce
Database**, including data generation, schema design, ER model, and SQL
operations. The database simulates realistic scenarios found in online
retail platforms, enabling practical learning in database management,
normalization, querying, and reporting.

## Features

-   Synthetic data generation for all tables
-   Normalized relational schema
-   Constraints for data integrity
-   ER diagram (add screenshot)
-   SQL CRUD operations
-   Joins, aggregate functions, stored procedures, and views

## Schema Summary

### Tables:

-   **Users** -- customer details, emails, contact info
-   **Products** -- catalog of items with price and stock
-   **Orders** -- user orders with date and status
-   **OrderItems** -- each product inside an order
-   **Payments** -- transaction details for orders

<img width="1354" height="567" alt="Image" src="https://github.com/user-attachments/assets/5b1a4390-42c3-41aa-ab2c-422803600196" />

## Data Generation

Data is completely synthetic. Randomized values ensure: - Realistic user
names, emails, contact numbers\
- Product pricing and stock variation\
- Order creation with timestamps\
- Controlled anomalies for realistic scenarios (e.g., missing phone
numbers)

## How to Use

1.  Import the SQL schema file into your RDBMS (MySQL/PostgreSQL).
2.  Insert the generated dataset.
3.  Run the provided SQL queries for analysis.

## Files Included

-   `schema.sql`
-   `data_insertion.sql`
-   `queries.sql`
-   `README.md` (this file)

## ER Diagram

<img width="550" height="431" alt="Image" src="https://github.com/user-attachments/assets/c7fecbe5-1116-46ab-b711-30ce28bd7072" />

## License

👤 Author

-  Vishva MV
-  University of Hertfordshire
-  Database Systems Course Project
