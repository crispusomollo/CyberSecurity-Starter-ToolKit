-- MySQL: list users, accounts without password, super users, ssl requirement
SELECT user, host, plugin, authentication_string IS NOT NULL AS has_password FROM mysql.user;
SELECT user, host FROM mysql.user WHERE authentication_string = '' OR authentication_string IS NULL;
SELECT user, host FROM mysql.user WHERE Super_priv='Y';
SHOW VARIABLES LIKE 'require_secure_transport';
