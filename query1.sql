SELECT 
r.Time as ReservationTime,
r.NumberOfCustomers,
c.Name as CustomerName,
c.PhoneNumber,
r.Date
from reservation r join customer c on r.CustomerID = c.CustomerID
where r.Status = 1 and r.RestaurantID = '10k10';


select * from restaurant;