-- Oracle Security Audit Script
SET LINESIZE 200
COLUMN USERNAME FORMAT A20
SELECT username, account_status, profile FROM dba_users;
SELECT * FROM dba_profiles WHERE resource_name IN ('PASSWORD_LIFE_TIME','FAILED_LOGIN_ATTEMPTS');
