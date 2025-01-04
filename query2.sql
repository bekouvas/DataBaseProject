SELECT 
    n.NotificationID,
    c.Name AS CustomerName,
    n.Message,
    n.DateSent
FROM 
    NOTIFICATION n
JOIN 
    CUSTOMER c ON n.CustomerID = c.CustomerID
WHERE 
    n.NotificationType = 'Confirmation';