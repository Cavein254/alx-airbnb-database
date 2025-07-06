# 🧠 Database Index Optimization Report

## ✅ Objective

Identify and create indexes to improve query performance on `users`, `bookings`, and `properties` tables.

---

## 🔍 High-Usage Columns (Based on Sample Queries)

From previous queries, the following columns are frequently used:

### `users` table

- `id` (used in JOIN and WHERE)
- `email` (likely used in WHERE conditions for login or lookup)

### `bookings` table

- `user_id` (used in JOIN and WHERE)
- `property_id` (used in JOIN and WHERE)
- `booking_date` or similar (if used in filtering or sorting)

### `properties` table

- `id` (used in JOIN and WHERE)
- `location` or `city` (if used in filters)

### `reviews` table

- `property_id` (used in WHERE and JOIN)
- `rating` (used in filtering and ordering)

---

## 🏗️ Suggested Indexes

```sql
-- USERS
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- BOOKINGS
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_property ON bookings(user_id, property_id);

-- PROPERTIES
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_location ON properties(location);

-- REVIEWS
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);
```

---

## ⏱️ Performance Measurement (Before vs After)

Use `EXPLAIN` or `ANALYZE` (PostgreSQL) to measure query plan improvements:

### Example:

```sql
-- Before indexing
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'john@example.com';

-- After creating index
CREATE INDEX idx_users_email ON users(email);

-- Run again
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'john@example.com';
```

Compare the output to verify improvements in:

- Cost
- Row estimates
- Execution time
