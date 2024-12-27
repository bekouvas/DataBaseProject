select
c.Name as CustomerName,
c.PhoneNumber,
c.Email as CustomerEmail,
r.Time as ReservationTime,
po.SpecialRequest
from preorder po join reservation r on po.ReservationID = r.ReservationID
join customer c on c.CustomerID = r.CustomerID
where r.RestaurantID = "10k10";

