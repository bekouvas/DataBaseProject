-- Drop existing users and roles (if they exist)
DROP USER IF EXISTS 'adminRestaurant_user'@'localhost';
DROP USER IF EXISTS 'customer_user'@'localhost';
DROP ROLE IF EXISTS 'adminRestaurant_role';
DROP ROLE IF EXISTS 'customer_role';

-- Step 1: Create the admin user
CREATE USER 'adminRestaurant_user'@'localhost' IDENTIFIED BY 'securepassword';

-- Step 2: Create an admin role (optional but recommended)
CREATE ROLE 'adminRestaurant_role';

-- Step 3: Grant the privileges to the admin role

GRANT SELECT, UPDATE ON mydb.reservation TO 'adminRestaurant_role';
GRANT SELECT, UPDATE ON mydb.preorder TO 'adminRestaurant_role';
GRANT SELECT, UPDATE, INSERT ON mydb.restaurant TO 'adminRestaurant_role';
GRANT SELECT, UPDATE, INSERT ON mydb.restaurantadministrator TO 'adminRestaurant_role';
GRANT SELECT ON mydb.review TO 'adminRestaurant_role';
GRANT SELECT,UPDATE,INSERT ON mydb.table TO 'adminRestaurant_role';
GRANT SELECT,UPDATE,INSERT ON mydb.waitlist TO 'adminRestaurant_role';
GRANT SELECT ON mydb.customer TO 'adminRestaurant_role';
GRANT SELECT,INSERT ON mydb.notification TO 'adminRestaurant_role';
GRANT SELECT ON mydb.payment TO 'adminRestaurant_role';

GRANT SELECT ON mydb.customer_log TO 'adminRestaurant_role';
GRANT SELECT ON mydb.pendingpayments TO 'adminRestaurant_role';

-- Step 4: Assign the role to the admin user
GRANT 'adminRestaurant_role' TO 'adminRestaurant_user'@'localhost';


-- Step 6: Create the customer user
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'securepassword';

CREATE ROLE 'customer_role';

-- Step 7: Grant specific privileges to the customer role
GRANT SELECT, INSERT, UPDATE ON mydb.reservation TO 'customer_role';
GRANT SELECT, INSERT, UPDATE ON mydb.preorder TO 'customer_role';
GRANT SELECT ON mydb.restaurant TO 'customer_role';
GRANT SELECT ON mydb.restaurantadministrator TO 'customer_role';
GRANT SELECT, INSERT, UPDATE ON mydb.review TO 'customer_role';
GRANT SELECT ON mydb.table TO 'customer_role';
GRANT SELECT,INSERT ON mydb.waitlist TO 'customer_role';
GRANT SELECT, INSERT, UPDATE  ON mydb.customer TO 'customer_role';
GRANT SELECT ON mydb.notification TO 'customer_role';
GRANT SELECT, INSERT ON mydb.payment TO 'customer_role';

GRANT 'customer_role' to 'customer_user'@'localhost';

