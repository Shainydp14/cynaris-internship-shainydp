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
