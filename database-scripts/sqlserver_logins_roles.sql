-- SQL Server: list logins and server role memberships
SELECT name, type_desc, create_date, modify_date, is_disabled FROM sys.server_principals WHERE type_desc IN ('SQL_LOGIN','WINDOWS_LOGIN','WINDOWS_GROUP');
SELECT sp.name AS LoginName, sr.name AS RoleName
FROM sys.server_role_members rm
JOIN sys.server_principals sp ON rm.member_principal_id = sp.principal_id
JOIN sys.server_principals sr ON rm.role_principal_id = sr.principal_id;
