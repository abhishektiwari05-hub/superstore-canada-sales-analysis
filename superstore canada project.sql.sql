use laptop;

-- View Dataset
select * from `superstore_canada (1)`;

-- Total Orders
select count(*) as Total_Orders
from `superstore_canada (1)`;

-- Total Sales
select round(sum(sales),2) as Total_Sales
from `superstore_canada (1)`;

-- Total Profit
select round(sum(profit),2) as Total_Profit
from `superstore_canada (1)`;

-- Total Quantity Sold
select sum(`Order Quantity`) as Total_Quantity
from `superstore_canada (1)`;

-- Average Order value
select round(avg(sales),2) as Avg_Order_Value
from `superstore_canada (1)`;

-- Highest Sales Order
select *
from `superstore_canada (1)`
order by sales desc
limit 1;

-- Highest Profit Order
select * 
from `superstore_canada (1)`
order by profit desc
limit 1;

-- Region Wise Sales
select region,
sum(sales) as Total_Sales
from `superstore_canada (1)`
group by region
order by Total_Sales desc;

-- Region Wise Profit
select region,
sum(profit) as Total_Profit
from `superstore_canada (1)`
group by region;

-- Province Wise Sales
select province,
sum(sales) as sales
from `superstore_canada (1)`
group by province;

-- Category Wise Sales
select `Product Category`,
sum(sales) as sales
from `superstore_canada (1)`
group by `Product Category`;

-- Category Wise Profit
select `Product Category`,
sum(profit) as Profit
from `superstore_canada (1)`
group by `Product Category`;

-- Sub Category Sales
select `Product Sub-Category`,
sum(sales) as Sales
from `superstore_canada (1)`
group by `Product Sub-Category`;

-- Top 10 Products by Sales
select `Product Name`,
sum(sales) as Sales
from `superstore_canada (1)`
group by `Product Name`
order by Sales desc
limit 10;

-- Top 10 Products by Profit
select `Product Name`,
sum(profit) as Profit
from `superstore_canada (1)`
group by `Product Name`
order by Profit desc
limit 10;

-- Lowest Profit Products
select `Product Name`,
sum(Profit) as Profit
from `superstore_canada (1)`
group by `Product Name`
order by Profit
limit 10;

-- Top Customers
select `Customer Name`,
sum(sales) as Sales
from `superstore_canada (1)`
group by `Customer Name`
order by Sales desc
limit 10;

-- Customer Segment Analysis
select `Customer Segment`,
sum(sales) as Sales,
sum(profit) as Profit
from `superstore_canada (1)`
group by `Customer Segment`;

-- Ship Mode Analysis
select `Ship Mode`,
count(*) as Orders,
sum(sales) as Sales
from `superstore_canada (1)`
group by `Ship Mode`;

-- Monthly Sales Trend 
select
monthname(`Order Date`) as Month,
sum(Sales) as Sales
from `superstore_canada (1)`
group by month(`Order Date`),
monthname(`Order Date`)
order by month(`Order Date`);

-- Year Wise Sales
select year(`Order Date`) as Year,
sum(sales) as Sales
from `superstore_canada (1)`
group by Year;

-- Average Profit by Region
select region,
avg(profit) as Avg_Profit
from `superstore_canada (1)`
group by region;

-- Average Sales by Category
select `Product Category`,
avg(sales) as Avg_Sales
from `superstore_canada (1)`
group by `Product Category`;

-- Rank Products by Sales
select `Product Name`,
sum(sales) as Sales,
rank() over(order by sum(sales) desc) as Product_Range
from `superstore_canada (1)`
group by `Product Name`;

-- Dense Rank Products 
select `Product Name`,
sum(profit) as Profit,
DENSE_RANK() over(order by sum(profit) desc) as Profit_Rank
from `superstore_canada (1)`
group by `Product Name`;

-- Running Sales Total
select `Order Date`,sales,
sum(sales) over(order by `Order Date`) as Running_Sales
from `superstore_canada (1)`;

-- Create Sales View
create view RegionSales as 

select region,
sum(sales) as TotalSales
from `superstore_canada (1)`
group by region;

-- View Data
select * from RegionSales;

-- Top 5 Customers using CTE
with CustomerSales as

(
select `Customer Name`,
sum(sales) as Sales
from `superstore_canada (1)`
group by `Customer Name`
)

select * 
from CustomerSales
order by sales desc
limit 5;

-- Most Profitable Region
select region
from `superstore_canada (1)`
group by region
order by sum(profit) desc
limit 1;

-- Total Discount Given
select
sum(Discount) as Total_Discount
from `superstore_canada (1)`;

-- Top Category by Profit
select `Product Category`,
sum(profit) as Profit
from `superstore_canada (1)`
group by `Product Category`
order by Profit desc
limit 1;

-- Dashboard KPI Query
SELECT
COUNT(*) AS Orders,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(`Order Quantity`) AS Quantity,
ROUND(AVG(Sales),2) AS Average_Order_Value
FROM `superstore_canada (1)`;