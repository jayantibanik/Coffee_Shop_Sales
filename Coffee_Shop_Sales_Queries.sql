-- KPI’S REQUIREMENTS – 

--1.Total Sales Analysis:

--• Calculate the total sales for each respective month.

Select ROUND(SUM(unit_price * transaction_qty)) as Total_Sales

From coffee_shop_sales

Where Month(transaction_date) = 5 ; -- May Month



--•	Determine the month-on-month increase or decrease in sales.

Select MONTH(transaction_date) as Month,

Round(SUM(unit_price * transaction_qty)) as Total_Sales,

(SUM(unit_price * transaction_qty)-LAG(SUM(unit_price * transaction_qty),1) 

OVER(ORDER BY MONTH(transaction_date)))/

LAG(SUM(unit_price * transaction_qty),1) OVER(ORDER BY MONTH(transaction_date)) * 

100 AS mom_increase_percentage

FROM coffee_shop_sales

WHERE MONTH(transaction_date) IN (4,5) -- April,May

GROUP BY MONTH(transaction_date)

ORDER BY MONTH(transaction_date);



--•	Calculate the difference in sales between the selected month and the previous month.

Select MONTH(transaction_date) as Month,

Round(SUM(unit_price * transaction_qty)) as Total_Sales,

ROUND((SUM(unit_price * transaction_qty)-LAG(SUM(unit_price * transaction_qty),1) 

OVER(ORDER BY MONTH(transaction_date)))/1000,1) AS MoM_difference

FROM coffee_shop_sales

WHERE MONTH(transaction_date) IN (4,5)  -- April,May

GROUP BY MONTH(transaction_date)

ORDER BY MONTH(transaction_date);



--2. Total Orders Analysis:

--•	Calculate the total number of orders for each respective month.

Select COUNT(transaction_id) as Total_Orders

From coffee_shop_sales

Where Month(transaction_date) = 5 ; -- May Month



--•	Determine the month-on-month increase or decrease in sales.

Select MONTH(transaction_date) as Month,

COUNT(transaction_id) as Total_Orders,

(COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) OVER(ORDER BY

MONTH(transaction_date)))/

LAG(COUNT(transaction_id), 1) OVER(ORDER BY MONTH(transaction_date)) * 100 AS 

MoM_increase_percentage

FROM coffee_shop_sales

WHERE MONTH(transaction_date) IN (4,5)   -- April,May

GROUP BY MONTH(transaction_date)

ORDER BY MONTH(transaction_date);



--•	Calculate the difference in sales between the selected month and the previous month.

Select MONTH(transaction_date) as Month,

COUNT(transaction_id) as Total_Orders,

ROUND((COUNT(transaction_id)-LAG(COUNT(transaction_id),1) OVER(ORDER BY 

MONTH(transaction_date)))/1000,1) AS MoM_difference

FROM coffee_shop_sales

WHERE MONTH(transaction_date) IN (4,5)  -- April,May

GROUP BY MONTH(transaction_date)

ORDER BY MONTH(transaction_date);



--3. Total Quantity Sold Analysis:

--•	Calculate the total quantity sold for each respective month.

Select SUM(transaction_qty) as Total_Quantity_Sold

From coffee_shop_sales

Where Month(transaction_date) = 5 ; -- May Month


--•	Determine the month-on-month increase or decrease in the total quantity sold.

Select MONTH(transaction_date) as Month,

SUM(transaction_qty) as Total_Qty,

(SUM(transaction_qty) - LAG(SUM(transaction_qty),1) OVER(ORDER BY 

MONTH(transaction_date)))/

LAG(SUM(transaction_qty),1) OVER(ORDER BY MONTH(transaction_date)) * 100 AS 

mom_increase_percentage

FROM coffee_shop_sales

WHERE MONTH(transaction_date) IN (4,5)  -- April,May

GROUP BY MONTH(transaction_date)

ORDER BY MONTH(transaction_date);



--•	Calculate the difference in sales between the selected month and the previous month.

Select MONTH(transaction_date) as Month,

SUM(transaction_qty) as Total_Quantity,

ROUND((SUM(transaction_qty)-LAG(SUM(transaction_qty),1) OVER(ORDER BY 

MONTH(transaction_date)))/1000,1) AS MoM_difference

FROM coffee_shop_sales

WHERE MONTH(transaction_date) IN (4,5)  -- April,May

GROUP BY MONTH(transaction_date)

ORDER BY MONTH(transaction_date);




-- CHARTS REQUIREMENTS

--1. Calendar Heat Map:

--•	Implement tooltip to display detailed metrics (Sales, Orders, Quantity)

Select ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,

COUNT(transaction_id) AS Total_Orders,

SUM(transaction_qty) AS Total_Qty_Sold

FROM coffee_shop_sales

WHERE transaction_date = '2023-05-18' ;



--2. Sales Analysis by Weekdays and Weekends:

--•	To determine total sales analysis by weekends and weekdays.

Select

Case

WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN "Weekends"

ELSE "Weekdays"

END AS Day_type,

ROUND(SUM(unit_price * transaction_qty)/1000) as Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5  -- May

GROUP BY Day_type;



--3. Sales Analysis by Store Location:

--•	To determine total sales by store location.

Select store_location, ROUND(SUM(unit_price * transaction_qty)/1000,2) AS Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5  -- May

GROUP BY  store_location
 
ORDER BY Total_Sales DESC ;



--4. Daily Sales Analysis with Average Line:

--•	To determine average daily sales for selected month.

Select ROUND(AVG(Total_Sales)) AS Average_Sales

FROM (

Select SUM(unit_price * transaction_qty) as Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5  -- May

GROUP BY Day(transaction_date) )

AS inner_query;


--•	Daily Sales for the selected month.

Select DAY(transaction_date) as Day_of_Month,

ROUND(SUM(unit_price * transaction_qty),1) as 

Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5 -- May

GROUP BY Day(transaction_date)

ORDER BY DAY(transaction_date) ;



--•	Comparing daily sales with average sales – If greater then “Above Average” and lesser then “Below Average”.

Select

Day_of_Month,

Total_Sales,

 CASE

 WHEN Total_Sales > Average_Sales THEN "Above Average"

 WHEN Total_Sales < Average_Sales THEN "Below Average"

 ELSE "Average" END AS "Sales Status" 

 FROM ( 

Select DAY(transaction_date) as Day_of_Month,

ROUND(SUM(unit_price * transaction_qty),1) as Total_Sales,

AVG(SUM(unit_price * transaction_qty)) OVER() AS average_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5  -- May

GROUP BY Day(transaction_date) 

ORDER BY DAY(transaction_date) 

) AS Inner_query ;



--5. Sales Analysis by Product Category:

--•	To determine total sales by product category.

Select product_category,  

ROUND(SUM(unit_price * transaction_qty)/1000,2) as Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5 -- May

GROUP BY  product_category

ORDER BY  Total_Sales DESC ;


--6. Top 10 Products by Sales:

--•	To determine top 10 selling products.

Select product_type,  

ROUND(SUM(unit_price * transaction_qty)/1000,2) as Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5 – May

GROUP BY  product_type

ORDER BY  Total_Sales DESC

LIMIT 10;





--7. Sales Analysis by Days and Hours:

--•	To determine total sales, orders and quantity sold by hours.

Select ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,

COUNT(transaction_id) AS Total_Orders,

SUM(transaction_qty) AS Total_Qty_Sold

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5 -- May

AND DAYOFWEEK(transaction_date)=4 -- Wednesday

AND HOUR(transaction_time)=7  -- Hour No 7;



--•	Total Sales Analysis by Hours.

Select HOUR(transaction_time),

ROUND(SUM(unit_price * transaction_qty)/1000) AS Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5  -- May

GROUP BY HOUR(transaction_time)

ORDER BY  Total_Sales DESC;



--•	To Get Sales from Monday to Sunday for Month of May.

Select 

CASE

WHEN DAYOFWEEK(transaction_date)=1 THEN "SUNDAY"

WHEN DAYOFWEEK(transaction_date)=2 THEN "MONDAY"

WHEN DAYOFWEEK(transaction_date)=3 THEN "TUSDAY"

WHEN DAYOFWEEK(transaction_date)=4 THEN "WEDNESDAY"

WHEN DAYOFWEEK(transaction_date)=5 THEN "THURSDAY"

WHEN DAYOFWEEK(transaction_date)=6 THEN "FRIDAY"

WHEN DAYOFWEEK(transaction_date)=7 THEN "SATURDAY"

END AS day_type,

ROUND(SUM(unit_price * transaction_qty)/1000) AS Total_Sales

FROM coffee_shop_sales

WHERE MONTH(transaction_date) = 5 -- May

GROUP BY day_type

ORDER BY 

CASE

WHEN day_type= "SUNDAY" THEN 1

WHEN day_type= "MONDAY" THEN 2

WHEN day_type= "TUSDAY" THEN 3

WHEN day_type= "WEDNESDAY" THEN 4

WHEN day_type="THURSDAY" THEN 5

WHEN day_type="FRIDAY" THEN 6

WHEN day_type= "SATURDAY" THEN 7

END;
