-- ================================================================
-- Airbnb Clone Sample Data
-- ================================================================
-- This script inserts sample data into the database
-- for testing and development.
-- ================================================================

-- This ensures that if you run the script multiple times, you won't
-- create duplicate data. The order is reversed from creation.

DELETE FROM Message;
DELETE FROM Review;
DELETE FROM Payment;
DELETE FROM Booking;
DELETE FROM Property;
DELETE FROM "User";

-- ================================================================
-- Users
-- ================================================================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '+1234567890', 'host'),
  (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '+1987654321', 'guest'),
  (gen_random_uuid(), 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '+1122334455', 'guest'),
  (gen_random_uuid(), 'Diana', 'Miller', 'diana@example.com', 'hashed_pw4', '+1222333444', 'host'),
  (gen_random_uuid(), 'Ethan', 'Hunt', 'ethan@example.com', 'hashed_pw5', '+1777888999', 'admin');

-- ================================================================
-- Properties
-- ================================================================
-- (Note: replace host_id with actual UUIDs of hosts from above)
INSERT INTO property (property_id, host_id, name, description, location, price_per_night)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE email='alice@example.com'),
   'Cozy Apartment in NYC', 'A modern and cozy 1-bedroom apartment in Manhattan.', 'New York, USA', 120.00),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE email='diana@example.com'),
   'Beach House in Miami', 'Spacious beach house with ocean views.', 'Miami, USA', 250.00);

-- ================================================================
-- Bookings
-- ================================================================
-- (Note: replace user_id with guest UUIDs)
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM property WHERE name='Cozy Apartment in NYC'),
   (SELECT user_id FROM users WHERE email='bob@example.com'),
   '2025-09-01', '2025-09-05', 480.00, 'confirmed'),

  (gen_random_uuid(),
   (SELECT property_id FROM property WHERE name='Beach House in Miami'),
   (SELECT user_id FROM users WHERE email='charlie@example.com'),
   '2025-10-10', '2025-10-15', 1250.00, 'pending');

-- ================================================================
-- Payments
-- ================================================================
-- (Link payments to confirmed bookings only)
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
  (gen_random_uuid(),
   (SELECT booking_id FROM booking WHERE status='confirmed' LIMIT 1),
   480.00, 'credit_card');

-- ================================================================
-- Reviews
-- ================================================================
INSERT INTO review (review_id, property_id, user_id, rating, comment)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM property WHERE name='Cozy Apartment in NYC'),
   (SELECT user_id FROM users WHERE email='bob@example.com'),
   5, 'Amazing place! Very clean and close to everything.'),

  (gen_random_uuid(),
   (SELECT property_id FROM property WHERE name='Beach House in Miami'),
   (SELECT user_id FROM users WHERE email='charlie@example.com'),
   4, 'Great location and view, but could use some upgrades.');

-- ================================================================
-- Messages
-- ================================================================
INSERT INTO message (message_id, sender_id, recipient_id, message_body)
VALUES
  (gen_random_uuid(),
   (SELECT user_id FROM users WHERE email='bob@example.com'),
   (SELECT user_id FROM users WHERE email='alice@example.com'),
   'Hi Alice, is the apartment available for early check-in?'),

  (gen_random_uuid(),
   (SELECT user_id FROM users WHERE email='alice@example.com'),
   (SELECT user_id FROM users WHERE email='bob@example.com'),
   'Hi Bob, yes you can check in at 1 PM.');

-- ================================================================
-- End of Sample Data
-- ================================================================
