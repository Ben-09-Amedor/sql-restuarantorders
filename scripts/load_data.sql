/*
===============================================================================
 Load maven (Source -> Food)
===============================================================================
Script Purpose:
    This scripts loads data into the 'food' schema from external CSV files. 
    It performs the following actions:
    - Truncates the food tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to food tables.

-------------------------------------------------------------------------------
*/


 -- loading data for order items 
TRUNCATE TABLE food.orders;
	
	BULK INSERT food.orders
	FROM 'C:\Users\Pc\Desktop\DATA FOR ANALYSIS\MSS SQL FOLDER\PROJECT_6\Restaurant_Orders\orders.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


  -- loading data for order items 
TRUNCATE TABLE food.menu;
	
	BULK INSERT food.menu
	FROM 'C:\Users\Pc\Desktop\DATA FOR ANALYSIS\MSS SQL FOLDER\PROJECT_6\Restaurant_Orders\menu.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
