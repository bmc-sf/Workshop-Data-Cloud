// 1. Create the Security Integration
CREATE SECURITY INTEGRATION DATACLOUD_INTEGRATION
TYPE = OAUTH
ENABLED = TRUE
OAUTH_CLIENT = CUSTOM
OAUTH_CLIENT_TYPE = 'CONFIDENTIAL'
OAUTH_REDIRECT_URI = 'https://login.salesforce.com/services/cdpSnowflakeOAuthCallback'
BLOCKED_ROLES_LIST = ()
OAUTH_ISSUE_REFRESH_TOKENS = TRUE
OAUTH_REFRESH_TOKEN_VALIDITY = 86400
;

// 2. Create ROLE for User
USE ROLE accountadmin;
CREATE ROLE sfadmin;
GRANT USAGE ON INTEGRATION DATACLOUD_INTEGRATION TO ROLE sfadmin;
//SHOW ROLES:

// 3. Create USER and assign our new Role to new User
CREATE USER sfadmin password='salesforce1' default_role = sfadmin must_change_password=false;
GRANT ROLE SFADMIN TO USER SFADMIN;

// 4. Create Warehouse and Assign new User
CREATE OR REPLACE warehouse myWarehouse WITH WAREHOUSE_SIZE=LARGE;
GRANT USAGE ON WAREHOUSE myWarehouse TO ROLE sfadmin;

// 5. Display & Review Security Integration object configuration
DESCRIBE INTEGRATION DATACLOUD_INTEGRATION;

// 6. Display the OAuth Client ID and Secret for Security Integration object DATACLOUD_INTEGRATION
SELECT SYSTEM$SHOW_OAUTH_CLIENT_SECRETS('DATACLOUD_INTEGRATION');

// ************************************
// Other things of interest & utility
// ************************************
//DESCRIBE USER sfadmin;
//DESCRIBE INTEGRATION DATACLOUD_INTEGRATION;

// ************************************
// *** If you need to undo anything ***
// ************************************
//SHOW INTEGRATIONS;
//SHOW ROLES;
//SHOW USERS;
//DROP INTEGRATION DATACLOUD_INTEGRATION;
//DROP USER SFADMIN;
//DROP ROLE SFADMIN;
