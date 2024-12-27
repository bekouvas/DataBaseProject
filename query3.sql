SELECT 
    c.Name, c.PhoneNumber, c.Email, w.PlaceInQueue, w.WaitlistID
FROM
    waitlist w
        JOIN
    customer c ON c.CustomerID = w.CustomerID
WHERE
    w.RestaurantID = '10k10';

