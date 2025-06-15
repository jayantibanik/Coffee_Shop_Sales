Coffee_Shop_Sales

A dynamic, interactive Power BI dashboard designed to explore coffee sales across multiple branches, products, and time periods.

The dashboard is a visually engaging and analytical Power BI report designed to help users explore sales performance throughout the year, broken down by months, weekdays vs. weekends, and revenue across different company branches.It focuses on highlighting top-selling products based on location, day, and time of day. This tool is intended for business analysts who rely on data-driven insights to understand customer demand and support decision-making.

# The dashboard was build using the following tools and technologies:
- Power BI Desktop - Main data visualization platform used for report creation.
- Power Query Editor - Data transformation and cleaning for reshaping and preparing the data.
- DAX (Data Analysis Expression) - Used for calculating measures and conditional logics.
- Data Modelling - To buit relationship between tables.
- File format - .pbix for development and .png for dashboard previews. 

# Data Source: CSV files

# Business Problem
The goal is to uncover sales patterns across locations and time to identify high-performing products and optimise business strategy.

# Dashboard Description - 
- Filter - A month slicer is used to filter sales by month.
- Calender Heat Map - It dynamically adjusts based on the selected month, it displays detailed metrics (Sales, Orders, Quantity) with the use of tooltip when       hovering over days and colour coding is done depending on sales on that day.
- Donut Chart - It analyse sales performance on weekdays vs weekends.
- Clustered Bar Chart - It shows total sales and sales difference from last month for all branches.
- KPI'S (Key Performance Indicators) - It displaces the total Sales , Total Orders and Total Quantity Sold for selected month.
- Stacked Column Chart - The sales over the month is shown with a constant line showing the average daily sales and colour coding is done depending on the sales is  above or below the average.
- Clustered Bar Chart - The product categories are displayed with their sales and percentage change from the previous month.
- Clustered Bar Chart - Top 10 selling products are displayed with their sales and percentage change from the previous month.
- Matrix - It is used to display sales in a week with hours of the day, alongside a stacked bar chart is displayed depending on total sales of that particular hour            of the whole week and stacked bar chart is used to display total sales of the week and colour-coding is done using conditional formatting.

Business Impact & Insights:
- Marketing Organisation - Companies can plan for great discounts (ex- happy-hours) in low running days to balance out the monthly sales.
- Strategic Planning - It can use it for keeping product stocks depending on customers demands.
- Regional Analysis - Depending on the customer traffic on various branches further openings can be done.

Dashboard Preview - https://github.com/jayantibanik/Coffee_Shop_Sales/blob/main/Dashboard_View.png
