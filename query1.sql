SELECT 
    r.Time AS ReservationTime,
    r.NumberOfCustomers,
    c.Name AS CustomerName,
    c.PhoneNumber,
    r.Date
FROM
    reservation r
        JOIN
    customer c ON r.CustomerID = c.CustomerID
WHERE
    r.Status = 1
        AND r.RestaurantID = '10k10';


select * from restaurant;