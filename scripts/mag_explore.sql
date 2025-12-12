SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT()
    - GROUP BY, ORDER BY
===============================================================================
*/


-- joining tables
SELECT 
  o.order_details_id,
  o.order_id,
  o.order_date,
  o.order_time,
  o.item_id,
  m.item_name,
  m.category,
  m.price
FROM food.orders o
LEFT JOIN food.menu m
ON o.item_id = m.menu_item_id
WHERE item_id != 'NULL' ; -- filter out items_id without orders
 

 -- find which category of product is ordered most

 SELECT
	 category,
	 COUNT(o.order_id) AS number_of_orders
FROM food.orders o
LEFT JOIN food.menu m
	ON o.item_id = m.menu_item_id
WHERE item_id != 'NULL'
GROUP BY  category
ORDER BY number_of_orders DESC ;  

 -- which  product is being order most

 SELECT
	 o.item_id,
	 m.item_name,
	 COUNT(o.order_id) AS number_of_orders
 FROM food.orders o
LEFT JOIN food.menu m
	ON o.item_id = m.menu_item_id
WHERE item_id != 'NULL'
GROUP BY  m.item_name,  o.item_id
ORDER BY number_of_orders DESC; 
 

 -- segement products into sales categories
 WITH order_items AS(
 SELECT
	 o.item_id,
	 m.item_name,
	 COUNT(o.order_id) AS number_of_orders,
	m.price
 FROM food.orders o
LEFT JOIN food.menu m
	ON o.item_id = m.menu_item_id
WHERE item_id != 'NULL'
GROUP BY  item_name,  item_id, m.price
)
,
 product_segement AS (

 SELECT 
	 item_id,
	 item_name,
	 number_of_orders,
	 (number_of_orders * price) AS total_sales
 FROM order_items
 )

 SELECT 
   item_id,
   item_name,
   number_of_orders,
   total_sales,
 CASE
		WHEN total_sales > 8000 THEN 'High Sales'
		WHEN total_sales BETWEEN 4000 AND 8000 THEN 'Medium Sales'
		ELSE 'Low Sales'
END AS item_segement
FROM product_segement
ORDER BY total_sales DESC;



-- find total orders and revenue by months
WITH monthly_profit AS(
 SELECT
	 o.order_date,
	 COUNT(o.order_id) AS number_of_orders,
	 m.price
FROM food.orders o
LEFT JOIN food.menu m
	ON o.item_id = m.menu_item_id
WHERE item_id != 'NULL'
GROUP BY  m.price,o.order_date
)
,
 monthly_segement AS (
 SELECT 
	 DATEPART(Month, order_date) AS order_month,
	 number_of_orders,
	 (number_of_orders * price) AS total_sales
 FROM monthly_profit
  
)
SELECT 
	order_month,  
	SUM(number_of_orders) AS total_order,
	SUM(total_sales) AS total_revenue
FROM monthly_segement
GROUP BY order_month 
ORDER BY total_revenue DESC;






