# ⚙️ SQL Performance Optimization Report

## 🎯 Objective

Refactor a complex SQL query that retrieves bookings, user details, property details, and payment information, aiming to reduce execution time and improve performance.

---

## 📝 Initial Query

```sql
-- ❌ Initial Complex Query
SELECT
    bookings.*,
    users.name AS user_name,
    users.email,
    properties.name AS property_name,
    properties.location,
    payments.amount,
    payments.status
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON payments.booking_id = bookings.id
WHERE
    bookings.id IS NOT NULL
    AND users.id IS NOT NULL;
```

## 📊 Performance Analysis (Before)

Use the `EXPLAIN` or `EXPLAIN ANALYZE` keyword in your database to analyze the performance of the initial query:

```sql
EXPLAIN ANALYZE
-- ❌ Initial Complex Query
SELECT
    bookings.*,
    users.name AS user_name,
    users.email,
    properties.name AS property_name,
    properties.location,
    payments.amount,
    payments.status
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON payments.booking_id = bookings.id;
```

Look for:

- Sequential scans
- Missing indexes
- High cost or execution time
- Excessive column retrieval

---

## ✅ Refactored Optimized Query

```sql
-- ✅ Refactored Optimized Query
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
```

### 🔧 Optimization Strategies Applied:

- Selected only necessary fields instead of `*`
- Applied table aliases for readability
- Ensured indexes are in place on:
  - `users.id`
  - `bookings.user_id`
  - `properties.id`
  - `bookings.property_id`
  - `payments.booking_id`

---

## 📊 Performance Analysis (After)

```sql
EXPLAIN ANALYZE
-- ✅ Refactored Optimized Query
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
```

You should see:

- Reduced total cost
- Fewer row estimates if joins are indexed
- Improved execution plan with index usage

---

## 📌 Conclusion

Using targeted fields, table aliasing, and proper indexing can significantly reduce query execution time and improve performance, especially when working with large datasets.
