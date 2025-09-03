-- ================================================================
-- Query 1: Total number of bookings made by each user
-- ================================================================

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN booking b
    ON u.user_id = b.user_id   -- Match users with their bookings
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;  -- Show users with most bookings first


-- ================================================================
-- Query 2: Rank properties based on total bookings
-- ================================================================

SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b
    ON p.property_id = b.property_id   -- Match properties with their bookings
GROUP BY p.property_id, p.name
ORDER BY total_bookings DESC;
