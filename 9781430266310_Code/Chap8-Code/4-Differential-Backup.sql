BACKUP DATABASE [ApressFinancial] 
TO  DISK = N'C:\APRESS_DEV1\MSSQL12.APRESS_DEV1\MSSQL\
BackupApressFinancialFirstFullBackup.bak' 
WITH  DIFFERENTIAL , 
NOFORMAT, NOINIT,  
NAME = N'ApressFinancial-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position 
from msdb..backupset 
where database_name=N'ApressFinancial' 
and backup_set_id=(select max(backup_set_id) 
                     from msdb..backupset 
                    where database_name=N'ApressFinancial' )
if @backupSetId is null 
begin 
    raiserror(N'Verify failed. Backup information for database
	''ApressFinancial'' not found.', 16, 1) 
end
RESTORE VERIFYONLY 
FROM  DISK = N'C:\APRESS_DEV1\MSSQL12.APRESS_DEV1\MSSQL\
BackupApressFinancialFirstFullBackup.bak' 
WITH  FILE = @backupSetId,  
NOUNLOAD,  NOREWIND
GO
