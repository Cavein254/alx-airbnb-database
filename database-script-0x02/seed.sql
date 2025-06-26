-- Sample Data Inserts

-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UNHEX(REPLACE('11111111-1111-1111-1111-111111111111', '-', '')), 'Alice', 'Host', 'alice.host@example.com', 'hashed_pw1', '1234567890', 'host'),
  (UNHEX(REPLACE('22222222-2222-2222-2222-222222222222', '-', '')), 'Bob', 'Host', 'bob.host@example.com', 'hashed_pw2', '1234567891', 'host'),
  (UNHEX(REPLACE('33333333-3333-3333-3333-333333333333', '-', '')), 'Charlie', 'Guest', 'charlie.guest@example.com', 'hashed_pw3', '1234567892', 'guest'),
  (UNHEX(REPLACE('44444444-4444-4444-4444-444444444444', '-', '')), 'Dana', 'Guest', 'dana.guest@example.com', 'hashed_pw4', '1234567893', 'guest');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UNHEX(REPLACE('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '-', '')), UNHEX(REPLACE('11111111-1111-1111-1111-111111111111', '-', '')), 'Ocean View Apartment', 'A lovely seaside apartment.', 'Mombasa', 120.00),
  (UNHEX(REPLACE('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '-', '')), UNHEX(REPLACE('22222222-2222-2222-2222-222222222222', '-', '')), 'Mountain Cabin', 'Peaceful retreat in the mountains.', 'Naivasha', 90.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UNHEX(REPLACE('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '-', '')), UNHEX(REPLACE('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '-', '')), UNHEX(REPLACE('33333333-3333-3333-3333-333333333333', '-', '')), '2025-07-01 14:00:00', '2025-07-05 11:00:00', 480.00, 'confirmed'),
  (UNHEX(REPLACE('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '-', '')), UNHEX(REPLACE('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '-', '')), UNHEX(REPLACE('44444444-4444-4444-4444-444444444444', '-', '')), '2025-08-10 15:00:00', '2025-08-12 10:00:00', 180.00, 'pending');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (UNHEX(REPLACE('ccccccc1-cccc-cccc-cccc-cccccccccccc', '-', '')), UNHEX(REPLACE('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '-', '')), 480.00, '2025-06-26 09:30:00', 'card');





