// 4. Create Warehouse and Assign new User
CREATE OR REPLACE warehouse myWarehouse WITH WAREHOUSE_SIZE=LARGE;
GRANT USAGE ON WAREHOUSE myWarehouse TO ROLE sfadmin;