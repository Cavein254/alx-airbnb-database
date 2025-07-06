# Step-by-Step Partitioning Plan

In MySQL, partitioning has restrictions:

- The partition key `(start_date)` must be part of all PRIMARY or UNIQUE keys.
- You can’t use foreign keys in a partitioned table.

To proceed, we’ll:

- Drop the foreign keys (or recreate them after partitioning using triggers or application logic).
- Redefine the primary key to include `start_date` and `booking_id`.

```sql
CREATE TABLE Booking_partitioned (
    booking_id  CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date TIMESTAMP NOT NULL,
    total_price DECIMAL(5,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);
```
