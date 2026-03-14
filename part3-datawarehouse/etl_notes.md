## ETL Decisions

### Decision 1 — Fixing Date Format

Problem:  
In the dataset, the date is written in the format `DD-MM-YYYY`. This format is not very convenient when working with SQL databases and doing time-based analysis.

Resolution:  
Before loading the data into the warehouse, the date format was changed to `YYYY-MM-DD`. This is the standard date format used in SQL and makes it easier to sort and analyze data by month or year.

---

### Decision 2 — Making Category Names Consistent

Problem:  
In the dataset, some category names were written differently, for example "electronics" and "Electronics". If we group data using these values, they would be treated as different categories.

Resolution:  
Before inserting the data into the `dim_product` table, the category names were cleaned so that they all follow the same format.

---

### Decision 3 — Calculating Total Revenue

Problem:  
The dataset provides `units_sold` and `unit_price`, but it does not directly provide the total sales value.

Resolution:  
While loading the data, the total revenue was calculated using:

`units_sold × unit_price`

This value was stored in the `fact_sales` table so that sales analysis can be done more easily.