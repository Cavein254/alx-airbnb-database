-- Initial Complex Query
EXPLAIN
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


-- Refactored Optimized Query
EXPLAIN
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