# SQL Window Functions Reference

This project provides a concise reference for SQL window functions such as `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`, and more. These functions are useful for tasks like ranking, trend comparison, and handling duplicates while retaining row-level detail.

## 🔍 What Are Window Functions?

Window functions perform calculations across a set of rows related to the current row. Unlike aggregate functions, they do **not collapse rows** — allowing you to keep full detail while performing running totals, rankings, comparisons, etc.

# 🧱 Common Window Functions
1. ROW_NUMBER()
Assigns a unique sequential number to each row within a partition.

2. RANK()
Assigns the same rank to tied rows, but skips the next rank(s).

3. DENSE_RANK()
Like RANK(), but doesn't skip rank values after ties.

4. LEAD()
Accesses the next row's value in a specified order.

5. LAG()
Accesses the previous row’s value in a specified order.
