/* PERSPEKTYWY */
-- Perspektywy miesiêcznej sprzeda¿y 
CREATE VIEW vw_monthly_sales AS
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month, 
    SUM(total_revenue) AS revenue
FROM amazon_sales_dataset
GROUP BY FORMAT(order_date, 'yyyy-MM');

-- miesiêczna sprzeda¿ (Order_Items + Orders)
CREATE VIEW vw_monthly_sales_normalized AS
SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(oi.total_revenue) AS revenue
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY FORMAT(o.order_date, 'yyyy-MM');