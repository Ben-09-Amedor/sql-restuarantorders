	/*
	=============================================================
	Create Database and Schemas
	=============================================================
	Script Purpose:
		This script creates a new database named 'RestuarantMensu' after checking if it already exists. 
		If the database exists, it is dropped and recreated. Additionally, the script sets up  schemas 
		within the database named 'maven'.
	
	WARNING:
		Running this script will drop the entire 'RestuarantMensu database if it exists
		All data in the database will be permanently deleted. Proceed with caution 
		and ensure you have proper backups before running this script.
	*/


USE master;
GO

		IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'RestaurantMenu')
				BEGIN
		ALTER DATABASE RestuarantMensu SET SINGLE_USER ROLLBACK IMMEDIATE
		GO
		END;


		CREATE DATABASE RestaurantMenu
		GO;


		USE RestaurantMenu
		GO;

		CREATE SCHEMA food
		GO;
