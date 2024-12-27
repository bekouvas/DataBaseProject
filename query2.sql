SELECT 
    t.Status AS TableStatus,
    t.Capacity AS TableCapacity,
    t.Location AS TableLocation,
    t.restaurantID,
    r.Date AS ReservationDate,
    r.Time AS ReservationTime
FROM
    `table` t
        JOIN
    reservation r ON t.RestaurantID = r.RestaurantID
WHERE
    r.status = 1;