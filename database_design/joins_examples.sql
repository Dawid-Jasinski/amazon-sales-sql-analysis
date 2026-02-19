SELECT
    oi.order_item_id,
    o.order_date,
    o.customer_region,
    oi.product_id,
    oi.product_category,
    oi.quantity_sold,
    oi.total_revenue
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
JOIN Products p ON oi.product_id = p.product_id;