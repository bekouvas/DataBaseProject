-- Create the admin user ????????????????????????????????????????????????????????????????????????????????????????????????????????????
DROP USER IF EXISTS 'db_admin'@'localhost';
CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'adminPassword';
GRANT ALL PRIVILEGES ON mydb.* TO 'db_admin'@'localhost'; 

-- Create the restaurantAdministrator User
DROP USER IF EXISTS 'rest_admin'@'localhost';
CREATE USER 'rest_admin'@'localhost' IDENTIFIED BY 'restAdminPassword';

-- RestaurantAdministrator join restaurant on restaurantAdministratorID, then join the previous with reservation on restaurantID, then join the previous
-- with customer on customerID to get the customer details for the restaurant the admin is assigned to 
DROP VIEW IF EXISTS AdminCustomerView;
CREATE VIEW AdminCustomerView AS
SELECT 
    c.CustomerID, 
    c.Name AS CustomerName, 
    c.Email AS CustomerEmail, 
    c.PhoneNumber AS CustomerPhone
FROM 
    Restaurantadministrator ra
    JOIN Restaurant rs ON ra.RestaurantAdministratorID = rs.RestaurantAdministratorID
    JOIN Reservation r ON rs.RestaurantID = r.RestaurantID
    JOIN Customer c ON r.CustomerID = c.CustomerID
WHERE 
    ra.RestaurantAdministratorID = CURRENT_USER; 
    
select * from AdminCustomerView;
    
GRANT SELECT ON mydb.admincustomerview TO 'rest_admin'@'localhost';
    

    
DROP VIEW IF EXISTS AdminReservationView;
CREATE VIEW AdminReservationView AS
SELECT 
    r.ReservationID, 
    r.Time AS ReservationTime, 
    r.Date AS ReservationDate, 
    r.NumberOfCustomers, 
    r.Status AS ReservationStatus
FROM 
    RestaurantAdministrator ra
    JOIN Restaurant rs ON ra.RestaurantAdministratorID = rs.RestaurantAdministratorID
    JOIN Reservation r ON rs.RestaurantID = r.RestaurantID
WHERE 
    ra.RestaurantAdministratorID = CURRENT_USER;
    
GRANT SELECT ON AdminReservationView TO 'rest_admin'@'localhost';



-- ΝΟΜΙΖΟ ΟΤΙ ΤΗΑ ΕΜΦΑΝΙΖΕΙ NULL GIA TA RESERVATIONS POY DEN EXOYN PREORDER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    
DROP VIEW IF EXISTS AdminPreOrderView;
CREATE VIEW AdminPreOrderView AS
SELECT 
    pr.PreOrderID, 
    pr.Status AS PreOrderStatus, 
    pr.SpecialRequest,
    r.ReservationID
FROM 
    RestaurantAdministrator ra
    JOIN Restaurant rs ON ra.RestaurantAdministratorID = rs.RestaurantAdministratorID
    JOIN Reservation r ON rs.RestaurantID = r.RestaurantID
    LEFT JOIN PreOrder pr ON r.ReservationID = pr.ReservationID
WHERE 
    ra.RestaurantAdministratorID = CURRENT_USER();

    
GRANT SELECT ON AdminPreOrderView TO 'rest_admin'@'localhost';



DROP VIEW IF EXISTS AdminReviewView;
CREATE VIEW AdminReviewView AS
SELECT 
    rv.ReviewID, 
    rv.Comments AS ReviewComments, 
    rv.Rating AS ReviewRating, 
    rv.Date AS ReviewDate
FROM 
    RestaurantAdministrator ra
    JOIN Restaurant rs ON ra.RestaurantAdministratorID = rs.RestaurantAdministratorID
    JOIN Review rv ON rs.RestaurantID = rv.RestaurantID
WHERE 
    ra.RestaurantAdministratorID = CURRENT_USER;
    
GRANT SELECT ON AdminReviewView TO 'rest_admin'@'localhost';
    
    

DROP VIEW IF EXISTS AdminWaitlistView;
CREATE VIEW AdminWaitlistView AS
SELECT 
    wl.WaitlistID, 
    wl.PlaceInQueue
FROM 
    RestaurantAdministrator ra
    JOIN Restaurant rs ON ra.RestaurantAdministratorID = rs.RestaurantAdministratorID
    JOIN Waitlist wl ON rs.RestaurantID = wl.RestaurantID
WHERE 
    ra.RestaurantAdministratorID = CURRENT_USER;
    
GRANT SELECT ON AdminWaitlistView TO 'rest_admin'@'localhost';


GRANT SELECT ON pendingpayments TO 'rest_admin'@'localhost';


    
-- FOR THE CUSTOMER-----------------------------------------------------------------------------------------------------------------
DROP USER IF EXISTS 'user'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'userPassword';

DROP VIEW IF EXISTS UserReservationsView;
CREATE VIEW UserReservationsView AS
SELECT 
    r.ReservationID, 
    r.Date, 
    r.Time, 
    r.Status, 
    r.NumberOfCustomers, 
    rs.Name AS RestaurantName
FROM 
    reservation r
    JOIN restaurant rs ON r.RestaurantID = rs.RestaurantID
WHERE 
    r.CustomerID = CURRENT_USER();
    
GRANT SELECT, UPDATE ON UserReservationsView TO 'user'@'localhost';



DROP VIEW IF EXISTS UserReviewsView;
CREATE VIEW UserReviewsView AS
SELECT 
    rev.ReviewID, 
    rev.Comments, 
    rev.Rating, 
    rev.Date, 
    rs.Name AS RestaurantName
FROM 
    review rev
    JOIN restaurant rs ON rev.RestaurantID = rs.RestaurantID
WHERE 
    rev.CustomerID = CURRENT_USER();
    
GRANT SELECT, INSERT ON UserReviewsView TO 'user'@'localhost';
    
    
DROP VIEW IF EXISTS UserPreOrdersView;
CREATE VIEW UserPreOrdersView AS
SELECT 
    po.PreOrderID, 
    po.SpecialRequest, 
    po.Status, 
    r.Date AS ReservationDate, 
    rs.Name AS RestaurantName
FROM 
    preorder po
    JOIN reservation r ON po.ReservationID = r.ReservationID
    JOIN restaurant rs ON r.RestaurantID = rs.RestaurantID
WHERE 
    r.CustomerID = CURRENT_USER();
    
GRANT SELECT, INSERT, UPDATE ON UserPreOrdersView TO 'user'@'localhost';
    

    
DROP VIEW IF EXISTS UserNotificationsView;
CREATE VIEW UserNotificationsView AS
SELECT 
    n.NotificationID, 
    n.Message, 
    n.NotificationType, 
    n.DateSent
FROM 
    notification n
WHERE 
    n.CustomerID = CURRENT_USER();
    
GRANT SELECT ON UserNotificationsView TO 'user'@'localhost';
    
    





-- TA INSERT ON PREPEI NA TO BALO STA TABLES POY DEN EXOUN JOINS







    
    
    

