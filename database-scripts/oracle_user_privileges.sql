-- Oracle: list users and their account status
SELECT username, account_status, created FROM dba_users ORDER BY username;
-- System privileges
SELECT grantee, privilege FROM dba_sys_privs ORDER BY grantee;
-- Object privileges
SELECT grantee, owner, table_name, privilege FROM dba_tab_privs ORDER BY grantee;
