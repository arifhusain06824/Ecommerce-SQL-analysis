# Ecommerce-SQL-analysis
SQL-based E-commerce Sales Analysis — business insights on revenue, top products, customer behavior, and sales trends using JOINs, GROUP BY, subqueries, and aggregate functions.


# 🛒 E-Commerce SQL Analysis

An end-to-end **SQL-based data analysis project** on an e-commerce database, covering customers, products, orders, order items, and payments. This project answers real-world business questions using **JOINs, GROUP BY, HAVING, Subqueries, and Aggregate Functions**.

---

## 🎯 Project Objective

Analyze an e-commerce database to extract meaningful business insights such as:

- Which customers are the top spenders?
- Which products and categories generate the most revenue?
- What is the monthly revenue trend?
- Which orders were cancelled or pending?
- Which products have never been ordered?
- Who are the top 5 best-selling products?

---

## 🗄️ Database Schema

The project uses **5 relational tables**:

| Table | Description |
|-------|-------------|
| **customers** | Customer details (name, email, city, state, signup_date) |
| **products** | Product catalog (name, category, price, stock) |
| **orders** | Order info (customer_id, order_date, status, total_amount) |
| **order_items** | Line items per order (product_id, quantity, price) |
| **payments** | Payment details (method, date, amount) |

### 🔗 Relationships
- `orders.customer_id` → `customers.customer_id`
- `order_items.order_id` → `orders.order_id`
- `order_items.product_id` → `products.product_id`
- `payments.order_id` → `orders.order_id`

---

## 🛠️ Tools & Concepts Used

| Concept | Usage |
|---------|-------|
| **INNER JOIN / LEFT JOIN** | Combining multi-table data |
| **GROUP BY + HAVING** | Aggregating and filtering groups |
| **Aggregate Functions** | `SUM()`, `AVG()`, `COUNT()`, `MAX()` |
| **Subqueries** | Comparing values with averages |
| **Date Functions** | `YEAR()`, `MONTH()`, `MONTHNAME()` |
| **ORDER BY + LIMIT** | Finding top-N results |

---

## 📂 Files in This Repository

| File | Description |
|------|-------------|
| `ecommerce_db.sql` | Full database creation script with tables and sample data |
| `queries.sql` | 20 business analysis queries (Q1–Q20) |
| `README.md` | Project documentation |

---

## 🔍 Sample Queries Covered

### 1. Top 5 Most Expensive Products

```sql
SELECT product_name, category, price
FROM products
ORDER BY price DESC
LIMIT 5;
```

### 2. Total Revenue from Delivered Orders

```sql
SELECT SUM(total_amount) AS total_revenue,
       COUNT(*) AS total_orders,
       ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders
WHERE status = 'Delivered';
```

### 3. Category-wise Total Sales Revenue

```sql
SELECT p.category,
       SUM(oi.quantity * oi.price) AS total_revenue,
       SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
```

### 4. Customers Who Never Placed Any Order

```sql
SELECT c.customer_id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       c.email, c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

### 5. Top 5 Best-Selling Products

```sql
SELECT p.product_name, p.category,
       SUM(oi.quantity) AS total_quantity_sold,
       SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_quantity_sold DESC
LIMIT 5;
```


