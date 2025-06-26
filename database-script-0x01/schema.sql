CREATE TABLE User (
    user_id BINARY(16) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(256) NOT NULL,
    phone_number VARCHAR(10),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
    property_id BINARY(16) PRIMARY KEY,
    host_id BINARY(16) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(50) NOT NULL,
    pricepernight DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

CREATE TABLE Booking (
    booking_id  BINARY(16) PRIMARY KEY,
    property_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    total_price DECIMAL(5,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  	FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
    
);

CREATE TABLE Payment (
    payment_id BINARY(16) PRIMARY KEY,
    booking_id BINARY(16),
    amount DECIMAL(5,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    payment_method ENUM('card', 'paypal', 'bank') NOT NULL,
  
  	FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review (
    review_id BINARY(16) PRIMARY KEY,
    property_id BINARY(16),
    user_id BINARY(16),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  	FOREIGN KEY (user_id) REFERENCES User(user_id),
  	FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

CREATE TABLE Message (
    message_id BINARY(16),
    sender_id BINARY(16),
    recipient_id BINARY(16),
    message_body TEXT NOT NULL,
    send_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  	FOREIGN KEY (sender_id) REFERENCES User(user_id),
  	FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);


