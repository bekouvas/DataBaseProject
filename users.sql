-- Drop existing users and roles (if they exist)
DROP USER IF EXISTS 'adminRestaurant_user'@'localhost';
DROP USER IF EXISTS 'customer_user'@'localhost';
DROP ROLE IF EXISTS 'adminRestaurant_role';
drop role if exists 'customer_role';

-- Step 1: Create the admin user
CREATE USER 'adminRestaurant_user'@'localhost' IDENTIFIED BY 'securepassword';

-- Step 2: Create an admin role (optional but recommended)
CREATE ROLE 'adminRestaurant_role';

-- Step 3: Grant all privileges to the admin role
GRANT ALL PRIVILEGES ON mydb.* TO 'adminRestaurant_role';

-- Step 4: Assign the role to the admin user
GRANT 'adminRestaurant_role' TO 'adminRestaurant_user'@'localhost';

-- Step 5: Apply changes
FLUSH PRIVILEGES;



-- Step 6: Create the customer user
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'securepassword';

create role 'customer_role';

-- Step 7: Grant specific privileges to the customer role
GRANT SELECT, INSERT, UPDATE ON mydb.reservation TO 'customer_role';
GRANT SELECT, INSERT ON mydb.preorder TO 'customer_role';
GRANT SELECT ON mydb.restaurant TO 'customer_role';
GRANT SELECT ON mydb.restaurantadministrator TO 'customer_role';
GRANT SELECT, INSERT, UPDATE ON mydb.review TO 'customer_role';
GRANT SELECT ON mydb.table TO 'customer_role';
GRANT SELECT ON mydb.waitlist TO 'customer_role';
GRANT SELECT, INSERT, UPDATE  ON mydb.customer TO 'customer_role';
GRANT SELECT ON mydb.notification TO 'customer_role';
GRANT SELECT, INSERT ON mydb.payment TO 'customer_role';

GRANT 'customer_role' to 'customer_user'@'localhost';

-- Step 8: Apply changes
FLUSH PRIVILEGES;
