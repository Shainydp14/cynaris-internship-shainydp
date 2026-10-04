# CIA AI Tool Interaction Log - Week 1 Day 1

### Session 1: SQL Mistake Research

- **My Question:** "What are the most common SQL mistakes junior data analysts make?"
- **CIA Suggestion:**
  1. Using `=` instead of `IS NULL` to check for missing data.
  2. Confusing the logical order of operations (thinking `SELECT` executes before `WHERE`).
  3. Overusing `SELECT *` in production instead of explicit columns.
- **My Implementation:** I explicitly wrote out specific columns for all 10 queries instead of using `SELECT *`, and correctly implemented `IS NULL` for query 10.

### Session 2: Job Description Requirements

- **My Question:** "What SQL concepts do data analyst job descriptions require most often?"
- **CIA Suggestion:** Filtering data using complex `WHERE` predicates (`IN`, `BETWEEN`, `LIKE`), aggregate functions, and multi-table `JOINs`.
- **My Implementation:** Focused my practice on mastering pattern matching (`LIKE`) and range constraints (`BETWEEN`).

# CIA AI Tool Interaction Log - Week 1 Day 3

### Session 1: Retail Business KPIs via GROUP BY
* **My Question:** "Give me 5 business KPIs I can calculate using SQL GROUP BY on a retail sales dataset"
* **CIA Suggestion:**
  1. **Average Order Value (AOV) by Region:** Identifying geographic spending habits using `AVG(sales_amount)` grouped by region.
  2. **Monthly Revenue Growth:** Tracking monthly sales trajectories using `SUM(sales_amount)` grouped by calendar month.
  3. **Product Category Penetration:** Determining top-performing inventories using `SUM(quantity)` grouped by product category.
  4. **Customer Purchase Frequency:** Finding loyal versus churn-risk cohorts using `COUNT(transaction_id)` grouped by customer ID.
  5. **High-Value Customer Segments:** Spotting top-tier spenders via `SUM(sales_amount)` grouped by customer ID, filtered with a `HAVING` clause.
* **My Implementation:** I structured `queries_day3.sql` to group sales data dynamically across region, category, and month, and used a `HAVING` clause to segment performance thresholds over \$50,000.

### Session 2: Career Tab Skill Exploration
* **My Search Query:** "SQL Aggregations"
* **Discovered Skills:** Industry job descriptions heavily prioritize candidate mastery of window functions (`SUM OVER`, `AVG OVER`) for running totals, cohort grouping structures, performance tuning for complex `GROUP BY` execution plans, and data pipeline transformations for data warehousing.
* **My Implementation:** Wrote a functional `SUM OVER(PARTITION BY...)` window function to calculate running total expenditures per customer over time.
