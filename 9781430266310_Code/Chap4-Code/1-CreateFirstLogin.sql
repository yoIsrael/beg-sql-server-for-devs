USE [master]
GO
CREATE LOGIN [FAT-BELLY-SONY\Apress_Product_Controllers] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
USE [ApressFinancial]
GO
CREATE USER [FAT-BELLY-SONY\Apress_Product_Controllers] FOR LOGIN [FAT-BELLY-SONY\Apress_Product_Controllers]
GO
