SELECT 
    t.Capacity AS TableCapacity,
    t.Location AS TableLocation,
    res.Name AS RestaurantName,
    r.Date AS ReservationDate,
    r.Time AS ReservationTime
FROM
    `table` t
        JOIN
    reservation r ON t.RestaurantID = r.RestaurantID
        JOIN
    restaurant res ON res.RestaurantID = r.RestaurantID
WHERE
    r.status = 1 AND t.status = 1;