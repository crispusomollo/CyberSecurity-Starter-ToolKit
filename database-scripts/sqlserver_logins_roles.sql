-- List logins and their roles
SELECT name, type_desc, create_date, modify_date, is_disabled FROM sys.sql_logins;

-- List server roles
SELECT sp.name AS LoginName, sr.name AS RoleName
FROM sys.server_role_members rm
JOIN sys.server_principals sp ON rm.member_principal_id = sp.principal_id
JOIN sys.server_principals sr ON rm.role_principal_id = sr.principal_id;

