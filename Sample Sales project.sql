-- Inspecting Data
SELECT * FROM sales1.`sales_data_sample (1)`;

-- Cheking Unique Values
SELECT DISTINCT status from sales1.`sales_data_sample (1)`;
SELECT DISTINCT year_id from sales1.`sales_data_sample (1)` ;
SELECT DISTINCT PRODUCTLINE from sales1.`sales_data_sample (1)`;
SELECT DISTINCT COUNTRY from sales1.`sales_data_sample (1)`;
SELECT DISTINCT DEALSIZE from sales1.`sales_data_sample (1)`;
SELECT DISTINCT TERRITORY from sales1.`sales_data_sample (1)`;


-- Analysis
SELECT PRODUCTLINE, sum(SALES) REVENUE
FROM sales1.`sales_data_sample (1)`
GROUP BY PRODUCTLINE
ORDER BY 2 DESC;

SELECT YEAR_ID, sum(SALES) REVENUE
FROM sales1.`sales_data_sample (1)`
GROUP BY YEAR_ID
ORDER BY 2 DESC;

SELECT DEALSIZE, sum(SALES) REVENUE
FROM sales1.`sales_data_sample (1)`
GROUP BY DEALSIZE
ORDER BY 2 DESC ;

-- Where was the best month for sales in a specific year? How much was earned that month?
SELECT MONTH_ID, sum(sales) REVENUE, COUNT(ORDERNUMBER) FREQUENCY 
FROM sales1.`sales_data_sample (1)`
WHERE YEAR_ID = 2003
GROUP BY MONTH_ID
ORDER BY 2 DESC ; 

-- November seems to be the month, what product do they sell in november?  Classic I believe
SELECT MONTH_ID, PRODUCTLINE, sum(sales) REVENUE, COUNT(ORDERNUMBER)
FROM sales1.`sales_data_sample (1)`
WHERE YEAR_ID = 2003 AND MONTH_ID = 11
GROUP BY MONTH_ID, PRODUCTLINE
ORDER BY 3 DESC ;

-- Who is our best customer?

SELECT CUSTOMERNAME,PRODUCTCODE, SUM(QUANTITYORDERED) AS total_sold
FROM sales1.`sales_data_sample (1)`
-- WHERE ORDERDATE >= '11-01-2003' AND ORDERDATE < '11-31-2003'
GROUP BY CUSTOMERNAME, PRODUCTCODE
ORDER BY total_sold DESC
LIMIT 1;


-- What product are the most often sold ?

SELECT ORDERNUMBER, PRODUCTCODE
FROM sales1.`sales_data_sample (1)`
WHERE STATUS = 'Shipped'
GROUP BY ORDERNUMBER, PRODUCTCODE
