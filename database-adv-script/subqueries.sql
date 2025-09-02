-- ================================================================
-- Query 1: Find all properties with an average rating greater than 4.0
-- Description: Uses a subquery to calculate the average rating per property
-- and selects only those properties that exceed the threshold.
-- ================================================================
SELECT *
FROM property
WHERE property_id IN (
    -- Subquery: find property_ids where average rating > 4
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- ================================================================
-- Query 2: Find users who have made more than 3 bookings
-- Description: Uses a correlated subquery to count bookings per user
-- and returns only users with more than 3 bookings.
-- ================================================================
SELECT *
FROM users u
WHERE (
    -- Correlated subquery: count bookings for the current user
    SELECT COUNT(*)
    FROM booking b
    WHERE b.user_id = u.user_id
) > 3;
