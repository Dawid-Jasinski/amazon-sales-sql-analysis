/*
    Procedura: sp_get_sales_by_region
    Opis: Zwraca wszystkie pozycje zamówieñ dla wybranego regionu.
*/

CREATE PROCEDURE sp_get_sales_by_region
    @region NVARCHAR(100) 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.order_id,
        o.order_date,
        o.customer_region,
        oi.product_id,
        oi.product_category,
        oi.quantity_sold,
        oi.total_revenue
    FROM Order_Items oi
    JOIN Orders o
        ON oi.order_id = o.order_id
    WHERE o.customer_region = @region
    ORDER BY o.order_date;
END;

/*
EXEC sp_get_sales_by_region @region = 'Asia';
EXEC sp_get_sales_by_region 'Europe';
*/

--------------------------------------------------------

/*
    Procedura: sp_get_sales_by_region_and_category
    Zwraca sprzeda¿  dla podanego regionu i kategorii produktu.
*/

CREATE PROCEDURE sp_get_sales_by_region_and_category
    @region      NVARCHAR(100),
    @category    NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.order_id,
        o.order_date,
        o.customer_region,
        oi.product_id,
        oi.product_category,
        oi.quantity_sold,
        oi.total_revenue
    FROM Order_Items oi
    JOIN Orders o
        ON oi.order_id = o.order_id
    WHERE o.customer_region   = @region
      AND oi.product_category = @category
    ORDER BY o.order_date;
END;



/*
EXEC sp_get_sales_by_region_and_category
    @region = 'North America',
    @category = 'Books';
*/



--------------------------------------------------------


/*
    Procedura: sp_get_monthly_sales_by_region
    Zwraca miesiêczn¹ sprzeda¿ dla wybranego regionu.
*/

CREATE PROCEDURE sp_get_monthly_sales_by_region
    @region NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        FORMAT(o.order_date, 'yyyy-MM') AS year_month,
        SUM(oi.total_revenue)           AS monthly_revenue
    FROM Order_Items oi
    JOIN Orders o
        ON oi.order_id = o.order_id
    WHERE o.customer_region = @region
    GROUP BY FORMAT(o.order_date, 'yyyy-MM')
    ORDER BY year_month;
END;


/*
EXEC sp_get_monthly_sales_by_region 'Asia';
*/

---------------------------------------------
/*
    Procedura: sp_get_region_kpi
    Opis: Zwraca jeden wiersz z KPI dla wybranego regionu:
          - total_revenue
          - avg_order_value
          - orders_count
*/

CREATE PROCEDURE sp_get_region_kpi
    @region NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        @region                                         AS region,
        SUM(oi.total_revenue)                          AS total_revenue,
        COUNT(DISTINCT o.order_id)                     AS orders_count,
        AVG(oi.total_revenue)                          AS avg_revenue_per_item,
        SUM(oi.total_revenue) / COUNT(DISTINCT o.order_id) 
                                                       AS avg_order_value
    FROM Order_Items oi
    JOIN Orders o ON oi.order_id = o.order_id
    WHERE o.customer_region = @region;
END;

/*
EXEC sp_get_region_kpi 'Europe';
*/

CREATE PROCEDURE sp_get_category_kpi 
    @category NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        @category                                         AS category,
        SUM(oi.total_revenue)                          AS total_revenue,
        COUNT(DISTINCT o.order_id)                     AS orders_count,
        AVG(oi.total_revenue)                          AS avg_revenue_per_item,
        SUM(oi.total_revenue) / COUNT(DISTINCT o.order_id) 
                                                       AS avg_order_value
    FROM Order_Items oi
    JOIN Orders o ON oi.order_id = o.order_id
    WHERE oi.product_category = @category;
END;

/*
EXEC sp_get_category_kpi 'Books';
*/


