// 2. Create ROLE for User
USE ROLE accountadmin;
CREATE ROLE sfadmin;
GRANT USAGE ON INTEGRATION DATACLOUD_INTEGRATION TO ROLE sfadmin;
//SHOW ROLES: