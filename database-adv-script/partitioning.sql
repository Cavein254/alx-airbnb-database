--Create a Partitioned Version of the Table
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

--Test Performance with a Range Query
--On original Table
EXPLAIN
SELECT * FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

--On Partitioned Table
EXPLAIN
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';