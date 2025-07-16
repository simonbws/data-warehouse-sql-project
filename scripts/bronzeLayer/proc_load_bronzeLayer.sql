/*
Stored Procedure: Load Bronze Layer (Source from csv -> Bronze)

Script purpose:
  This stored procedure loads data from csv files into the 'bronzeLayer' schema. 
  It contains actions like:
    -Truncates the bronze tables before loading data.
    -Uses the BULK INSERT command to load data.

Usage Example:
EXEC bronzeLayer.load_bronze;
=======================================================
*/
CREATE OR ALTER PROCEDURE bronzeLayer_load_bronzeLayer AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY
		PRINT '--------------------';
		PRINT 'Loading Bronze Layer';
		PRINT '--------------------';

		SET @start_time = GETDATE();
		PRINT 'Loading CRM Tables';
		TRUNCATE TABLE bronzeLayer.crm_cust_info;
		BULK INSERT bronzeLayer.crm_cust_info
		FROM 'C:\Users\szymo\Desktop\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronzeLayer.crm_prd_info;
		BULK INSERT bronzeLayer.crm_prd_info
		FROM 'C:\Users\szymo\Desktop\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronzeLayer.crm_sales_details;
		BULK INSERT bronzeLayer.crm_sales_details
		FROM 'C:\Users\szymo\Desktop\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';

		PRINT '--------------------';
		PRINT 'Loading ERP Tables';
		PRINT '--------------------';

		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronzeLayer.erp_cust_az12;
		BULK INSERT bronzeLayer.erp_cust_az12
		FROM 'C:\Users\szymo\Desktop\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronzeLayer.erp_loc_a101;
		BULK INSERT bronzeLayer.erp_loc_a101
		FROM 'C:\Users\szymo\Desktop\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';


		SET @start_time = GETDATE();
		TRUNCATE TABLE bronzeLayer.erp_px_cat_g1v2;
		BULK INSERT bronzeLayer.erp_px_cat_g1v2
		FROM 'C:\Users\szymo\Desktop\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';
	END TRY
	BEGIN CATCH
		PRINT '===================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST (ERROR_MESSAGE() AS NVARCHAR);
		PRINT '===================='
	END CATCH
END
