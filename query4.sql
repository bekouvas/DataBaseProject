SELECT 
    c.Name AS CustomerName,
    c.PhoneNumber,
    c.Email AS CustomerEmail,
    r.Time AS ReservationTime,
    po.SpecialRequest
FROM
    preorder po
        JOIN
    reservation r ON po.ReservationID = r.ReservationID
        JOIN
    customer c ON c.CustomerID = r.CustomerID
WHERE
    r.RestaurantID = '10k10';

