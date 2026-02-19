-- Liczba rekordów 
SELECT COUNT(*) AS total_rows
FROM amazon_sales_dataset;

-- Podgl¹d pierwszych rekordów 
SELECT TOP 20 *
FROM amazon_sales_dataset;

-- Lista kategorii produktów 
SELECT DISTINCT product_category
FROM amazon_sales_dataset;
