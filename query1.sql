SELECT 
r.Time as ReservationTime,
r.NumberOfCustomers,
c.Name as CustomerName,
c.PhoneNumber
from reservation r join customer c on r.CustomerID = c.CustomerID
where r.Status = 1;