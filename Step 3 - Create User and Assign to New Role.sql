// 3. Create USER and assign our new Role to new User
CREATE USER sfadmin password='salesforce1' default_role = sfadmin must_change_password=false;
GRANT ROLE SFADMIN TO USER SFADMIN;