-- Check backup status for Oracle
SELECT 
  file_name, 
  completion_time, 
  status 
FROM dba_backup_files
ORDER BY completion_time DESC;

