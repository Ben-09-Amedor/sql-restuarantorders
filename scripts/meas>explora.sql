/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), DATEPART()
===============================================================================
*/



 -- find the the maximum and minimum price
 SELECT 

	 MAX(price) AS max_price,
	 MIN(price) AS min_price
 FROM food.menu;
  -- first and last orders
SELECT
	 MAX(order_date) AS last_order,
	 MIN(order_date) AS first_order
 FROM food.orders;

 -- count total numbers of orders
 SELECT Count(order_details_id) AS total_orders
 FROM food.orders
 WHERE item_id != 'NULL';


 -- find period with the most orders
 SELECT COUNT(*) AS number_of_orders,
 DATEPART(HOUR,order_time) AS hourly_pecks
 FROM food.orders
 GROUP BY  DATEPART(HOUR,order_time)
 ORDER BY COUNT(*)  DESC;


 -- find month with the most orders
 SELECT COUNT(*) AS number_of_orders,
 DATEPART(Month,order_date) AS Months_pecks
 FROM food.orders
 GROUP BY DATEPART(Month,order_date) 
 ORDER BY COUNT(*)  DESC;


-- find number of items by category
 SELECT
 Category,
  COUNT(*) AS number_of_items
 FROM food.menu
 GROUP BY  Category;

 -- find total numbers of food items
 SELECT 
 Count(menu_item_id) AS total_items
 FROM food.menu;
 
