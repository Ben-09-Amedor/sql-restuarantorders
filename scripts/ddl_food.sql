/*
===============================================================================
DDL Script: Create food
===============================================================================
Script Purpose:
    This script creates tables in the 'food schema dropping exiting table 
    if they already exist.
	  Run this script to re-define the DDL structure of 'food Table
===============================================================================
*/


IF OBJECT_ID ('food.orders', 'U') IS NULL
 DROP  TABLE food.orders;
  GO;

  CREATE TABLE food.orders(

         order_details_id          NVARCHAR(10),
         order_id                  NVARCHAR(10),
         order_date                DATE,
         order_time                TIME,
         item_id                   NVARCHAR(10)


        )

    GO;

IF OBJECT_ID ('food.menu', 'U') IS NULL
 DROP  TABLE food.menu;
  GO;

  CREATE TABLE food.menu(

  menu_item_id                  NVARCHAR(10),
  item_name                     NVARCHAR(50),
  category                      NVARCHAR(10),
  price                         DECIMAL(10,2)

  )

  GO;
