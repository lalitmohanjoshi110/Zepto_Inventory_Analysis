-- table creation 
create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);


-- data exploration

-- count of rows
select count(*) from zepto;

-- sample data
SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- differenct product categories
select distinct category, count(*) as no_of_count
from zepto
group by category
order by count(*)
;
-- Products in stock v/s out of stock
select outOfStock, count(sku_id) 
from zepto
group by outOfStock;

-- product names present multiple times

SELECT DISTINCT NAME, COUNT(sku_id) FROM ZEPTO
GROUP BY NAME
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id) DESC;

-- Data Cleaning 

-- Products with price = 0
select * from zepto
where mrp = 0 or discountedSellingPrice= 0;

-- delete from zepto where price= 0        -- important concept 

SET SQL_SAFE_UPDATES = 0;                  -- to permanently update changes 
DELETE FROM zepto WHERE mrp = 0;
SET SQL_SAFE_UPDATES = 1;

-- Convert paisa to Rupees and update in the table also.
    SET SQL_SAFE_UPDATES = 0;
	update zepto 
	set mrp = mrp/100.0, discountedSellingPrice = discountedSellingPrice/100.0;
	select * from zepto;
 
 -- data analysis
 
-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name, mrp, discountPercent 
from zepto  
order by discountPercent desc
limit 10;

-- Q2.What are the Products with High MRP but Out of Stock
select distinct name, mrp
from zepto
where mrp >300 and outOfstock = 0
order by mrp desc;

-- Q3.Calculate Estimated Revenue for each category
select category, sum(discountedSellingPrice * availableQuantity) as Total_Revenue  -- avg(discountedSellingPrice * quantity) as average revenue 
from zepto
group by category 
order by Total_Revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name, mrp, discountPercent
from zepto 
where mrp >500 and discountPercent<10
order by mrp desc, discountPercent desc;
-- Note: these itmes are not having much discount because these items are regular usage products and these sell well.

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category, avg(discountPercent) as avg_price
from zepto
group by category
order by avg_price desc;

-- In general 
SET SQL_SAFE_UPDATES = 0;
UPDATE zepto
SET outOfStock = 
    CASE
        WHEN outOfStock = 0 THEN 1
        ELSE 1
    END;
    
-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, discountedSellingPrice, weightInGms, 
case 
when weightInGms >100
then discountedSellingPrice/weightInGms
else discountedSellingPrice
end as price_per_gram
from zepto
order by price_per_gram;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, discountedSellingPrice, 
case 
when discountedSellingPrice between 0 and 100 then "Low"
when discountedSellingPrice between 100 and 200 then "Medium"
when discountedSellingPrice >200 then "High"
end  as Prod_category
from zepto;

-- Q8.What is the Total Inventory Weight Per Category
select category, sum(weightInGms*availableQuantity) AS Total_weight
from zepto
group by category
order by Total_weight;