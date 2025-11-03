-- MySQL Security Audit Script
SELECT user, host, authentication_string FROM mysql.user;
SHOW VARIABLES LIKE 'validate_password%';

