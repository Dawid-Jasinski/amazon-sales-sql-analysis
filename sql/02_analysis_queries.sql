/* ANALIZY SPRZEDA¯OWE */
-- Sprzeda¿ per kategoria 
SELECT product_category, SUM(total_revenue) AS total_sales 
FROM amazon_sales_dataset
GROUP BY product_category
ORDER BY total_sales DESC;

-- Sprzeda¿ per region 
SELECT customer_region, SUM(total_revenue) AS revenue
FROM amazon_sales_dataset
GROUP BY customer_region
ORDER BY revenue DESC;

-- Sprzeda¿ per kategoria i region
SELECT product_category, customer_region, SUM(total_revenue) AS total_revenue
FROM amazon_sales_dataset
GROUP BY product_category, customer_region
ORDER BY product_category, total_revenue DESC;

-- TOP 10 najlepiej sprzedaj¹cych siê produktów
SELECT TOP 10 product_id, SUM(total_revenue) AS revenue
FROM amazon_sales_dataset
GROUP BY product_id
ORDER BY revenue DESC;

-- Œrednia wartoœæ zamówienia (AOV)
SELECT AVG(total_revenue) AS avg_order_value
FROM amazon_sales_dataset;

-- Œrednia liczba sztuk na zamówienie
SELECT AVG(quantity_sold) AS avg_quantity_per_order
FROM amazon_sales_dataset;

-- £¹czny przychód
SELECT SUM(total_revenue) AS total_revenue_all
FROM amazon_sales_dataset;

-- Œredni procent rabatu
SELECT AVG(discount_percent) AS avg_discount_percent
FROM amazon_sales_dataset;

/* ANALIZA RATINGU */
-- Ocena sprzeda¿y – œredni rating
SELECT AVG(rating) AS mean_rating 
FROM amazon_sales_dataset;

-- Zale¿noœæ: rating a przychód
SELECT 
    rating,
    COUNT(*)           AS orders_count,
    AVG(total_revenue) AS avg_revenue_per_order,
    SUM(total_revenue) AS total_revenue_for_rating
FROM amazon_sales_dataset
GROUP BY rating
ORDER BY rating DESC;


/* ANALIZA RABATÓW */
-- Wp³yw rabatu na œredni przychód zamówienia 
SELECT 
    discount_percent,
    COUNT(*)                         AS orders_count,
    AVG(total_revenue)               AS avg_revenue_per_order,
    SUM(total_revenue)               AS total_revenue_for_discount
FROM amazon_sales_dataset
GROUP BY discount_percent
ORDER BY discount_percent;



/* ANALIZY CZASOWE */
-- Sprzeda¿ miesiêczna 
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month, 
    SUM(total_revenue) AS monthly_revenue
FROM amazon_sales_dataset
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY year_month;


/* FUNKCJE OKIENKOWE */
-- Ranking produktów w ramach kategorii 
SELECT
    product_category,
    product_id,
    SUM(total_revenue) AS total_rev,
    RANK() OVER (
        PARTITION BY product_category
        ORDER BY SUM(total_revenue) DESC
    ) AS category_rank
FROM amazon_sales_dataset
GROUP BY product_category, product_id;

-- Ranking regionów wg przychodu w ramach kategorii 
SELECT
    product_category,
    customer_region,
    SUM(total_revenue) AS revenue,
    RANK() OVER (
        PARTITION BY product_category
        ORDER BY SUM(total_revenue) DESC
    ) AS region_rank_in_category
FROM amazon_sales_dataset
GROUP BY product_category, customer_region;




/* ANALIZY NA WIDOKU */
-- Podgl¹d miesiêcznej sprzeda¿y z widoku vw_monthly_sales
SELECT TOP (1000) [month],
       [revenue]
FROM [Amazon].[dbo].[vw_monthly_sales]


/* ANALIZY NA ZNORMALIZOWNAEJ BAZIE */
-- Sprzeda¿ per region
SELECT
    o.customer_region,
    SUM(oi.total_revenue) AS revenue
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY o.customer_region
ORDER BY revenue DESC;

-- Sprzeda¿ per kategoria
SELECT
    oi.product_category,
    SUM(oi.total_revenue) AS revenue
FROM Order_Items oi
GROUP BY oi.product_category
ORDER BY revenue DESC;

-- TOP produkty
SELECT
    oi.product_id,
    SUM(oi.total_revenue) AS revenue
FROM Order_Items oi
GROUP BY oi.product_id
ORDER BY revenue DESC;

-- Sezonowoœæ
SELECT
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(oi.total_revenue) AS revenue
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;






