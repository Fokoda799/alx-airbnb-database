SELECT 
    booking.booking_id,
    users.first_name,
    users.last_name,
    users.email,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status
FROM booking
INNER JOIN users
ON booking.user_id = users.user_id;

SELECT * 
FROM property 
LEFT JOIN review 
ON review.property_id = property.property_id
ORDER BY property.created_at;


SELECT *
FROM users
FULL OUTER JOIN booking
ON booking.user_id = users.user_id;
