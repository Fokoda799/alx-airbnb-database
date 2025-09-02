-- ================================================================
-- Airbnb Database Queries
-- ================================================================
-- This file contains advanced SQL queries for the Airbnb database.
-- Queries include INNER JOIN, LEFT JOIN, and FULL OUTER JOIN examples.
-- ================================================================

-- ================================================================
-- 1️⃣ Retrieve all bookings with the respective users
-- Description: Shows bookings along with the user who made each booking.
-- ================================================================
SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    u.email,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM booking AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
ORDER BY b.start_date;

-- ================================================================
-- 2️⃣ Retrieve all properties along with their reviews
-- Description: Shows all properties and any associated reviews.
-- Uses LEFT JOIN to include properties even if they have no reviews.
-- ================================================================
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM property AS p
LEFT JOIN review AS r
    ON r.property_id = p.property_id
ORDER BY p.created_at, r.created_at;

-- ================================================================
-- 3️⃣ Retrieve all users with their bookings
-- Description: Shows all users and any bookings they have.
-- Uses FULL OUTER JOIN to include users without bookings and bookings without users.
-- ================================================================
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM users AS u
FULL OUTER JOIN booking AS b
    ON u.user_id = b.user_id
ORDER BY u.user_id NULLS LAST, b.start_date;

-- ================================================================
-- End of SQL Queries
-- ================================================================
