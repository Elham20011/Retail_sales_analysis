-- cleaning --

select *
from retail
where transactions_id is null
or sale_date is null
or sale_time is null 
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;
 
 
 SELECT customer_id, COUNT(*) AS count
FROM retail
group by customer_id
HAVING COUNT(*) > 1;

UPDATE retail
SET sale_date = STR_TO_DATE(sale_date, '%d/%m/%Y');

 ALTER TABLE retail
MODIFY COLUMN sale_date DATE;

-- add hour column --

ALTER TABLE retail
ADD COLUMN sale_hour INT;

UPDATE retail
SET sale_hour = HOUR(sale_time);

ALTER TABLE retail
ADD COLUMN time_category VARCHAR(10);

UPDATE retail
SET time_category = CASE
    WHEN HOUR(sale_time) BETWEEN 5 AND 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 13 AND 18 THEN 'Afternoon'
    ELSE 'Night'
END;

ALTER TABLE retail
ADD COLUMN age_category VARCHAR(10);

UPDATE retail
SET age_category = CASE
    WHEN age  BETWEEN 0 AND 17 THEN 'Teen'
    WHEN age BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Old'
END;

select * from retail 
where age_category = 'Teen';

select * from retail;

-- calc the profit --

ALTER TABLE retail
ADD COLUMN profit DECIMAL(10,2);

UPDATE retail
SET profit = total_sale - cogs;

ALTER TABLE retail
ADD COLUMN Year_name INT,
ADD COLUMN Month_name VARCHAR(10),
ADD COLUMN Day_name VARCHAR(10);

UPDATE retail
SET 
    year_name = YEAR(sale_date),
    day_name = DAYNAME(sale_date),
    month_name = MONTHNAME(sale_date);
    
    select * from retail;
    
     SELECT transactions_id, COUNT(*) AS count
FROM retail
group by transactions_id
HAVING COUNT(*) > 1;

select sum(profit) , year_name 
from retail
group by year_name;