-- Retrieve all data
SELECT * FROM retail_sales;

-- Check For Null Values
SELECT * FROM retail_sales
WHERE
	transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
	customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL OR 
	quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;

-- Delete Null or Empty Values
DELETE FROM retail_sales
WHERE
	transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
	customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL OR
	quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;

-- How many sales we have?
SELECT COUNT(*) FROM retail_sales;

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' & 
-- the quantity sold is more than 4 in the month of Nov-2022:
SELECT * FROM retail_sales
WHERE category = 'Clothing' AND 
	TO_CHAR(sale_date, 'yyyy-mm') = '2022-11' AND
	quantity > 4;


-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category:
SELECT ROUND(AVG(age),2) as beauty_category_average_age FROM retail_sales
WHERE category = 'Beauty';


-- Write a SQL query to find all transactions where the total_sale is greater than 1000 :
SELECT * FROM retail_sales 
WHERE total_sale > 1000;


-- Write a SQL query to find the total number of transactions (transaction_id)
-- made by each gender in each category.:
SELECT category, gender, COUNT(*) FROM retail_sales
GROUP BY category, gender
ORDER BY 1;

-- Write a SQL query to calculate the average sale for each month. 
-- Find out best selling month in each year:


-- Write a SQL query to find the top 5 customers 
-- based on the highest total sales:



-- Write a SQL query to find the number of unique customers .
-- who purchased items from each category.
SELECT COUNT(DISTINCT(category)) FROM retail_sales;

SELECT COUNT(customer_id)
FROM retail_sales
WHERE category = 'Clothing' AND category = 'Beauty' AND category = 'Electronics';


-- Write a SQL query to create each shift and number of orders 
-- (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

WITH hourly_sale
AS
(
SELECT *,
	CASE 
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
FROM retail_sales
)
SELECT 
	shift,
	COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;




