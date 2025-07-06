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


-- Before indexing
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'john@example.com';

-- After creating index
CREATE INDEX idx_users_email ON users(email);

-- Run again
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'john@example.com';