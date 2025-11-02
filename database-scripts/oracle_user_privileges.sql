-- List all users
SELECT username, account_status FROM dba_users;

-- List system privileges per user
SELECT grantee, privilege FROM dba_sys_privs;

-- List object privileges
SELECT grantee, owner, table_name, privilege FROM dba_tab_privs;

