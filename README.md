# 📊 Sales Trend SQL Analysis

### Internship Task – Data Analyst Role @ Elevate Labs  
**Objective:** Analyze monthly revenue and order volume using SQL aggregations on a cleaned version of the Superstore dataset.

---

## 🗂 Dataset Overview

We used the popular **Superstore** dataset and extracted only the relevant columns:

| Original Column        | Retained? | Renamed As   |
|------------------------|-----------|--------------|
| Order ID               | ✅        | `order_id`   |
| Order Date             | ✅        | `order_date` |
| Product ID             | ✅        | `product_id` |
| Sales                  | ✅        | `amount`     |
| All other columns      | ❌        | Removed       |

---

## 🧼 Data Cleaning Process

### 🧾 Step 1: Initial Refinement in Excel
- Removed unnecessary columns (customer info, location, ship details, etc.).
- Retained only 4 columns: `Order ID`, `Order Date`, `Product ID`, `Sales`.
- Renamed columns to: `order_id`, `order_date`, `product_id`, `amount`.

### 🧾 Step 2: Cleaning in Google Colab (Python)
- Handled inconsistent date formats (`11/8/16`, `4-15-2017`, etc.).
- Used `pandas.to_datetime()` with `format='mixed'` and `dayfirst=True`.
- Saved cleaned file as `online_sales.csv` in `YYYY-MM-DD` format.

### 🧾 Step 3: Date Handling in MySQL
- During import via MySQL Workbench:
  - Set `order_date` as `VARCHAR` initially to avoid format issues.
  - After import, used `STR_TO_DATE()` to convert to `DATE` format.
  - Altered the column to type `DATE`.

---

## 🏗 Database Table: `online_sales`

| Column       | Type          | Description                       |
|--------------|---------------|-----------------------------------|
| order_id     | VARCHAR       | Unique ID for each order          |
| order_date   | DATE          | Order placement date              |
| product_id   | VARCHAR       | Identifier of the product         |
| amount       | DECIMAL(10,2) | Sales revenue for that order line |

---

## 🧠 Business Objective

> To evaluate how the business is performing monthly in terms of **revenue** and **order volume**.

---

## 🧾 Final SQL Query Used

```sql
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS year_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    year_month
ORDER BY 
    year_month;
