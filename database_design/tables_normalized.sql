-- Tabela ORDERS
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_region VARCHAR(100),
    payment_method VARCHAR(50)
);

INSERT INTO Orders
SELECT DISTINCT
    order_id,
    order_date,
    customer_region,
    payment_method
FROM amazon_sales_dataset;

-- Tabela PRODUCTS
CREATE TABLE Products (
    product_id INT PRIMARY KEY
);

INSERT INTO Products (product_id)
SELECT DISTINCT product_id
FROM amazon_sales_dataset;


-- Tabela ORDER_ITEMS
CREATE TABLE Order_Items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    product_id INT,
    product_category VARCHAR(100),
    price DECIMAL(10,2),
    discount_percent INT,
    quantity_sold INT,
    rating DECIMAL(3,1),
    review_count INT,
    discounted_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items (
    order_id, product_id, product_category, price,
    discount_percent, quantity_sold, rating, review_count,
    discounted_price, total_revenue
)
SELECT
    order_id, product_id, product_category, price,
    discount_percent, quantity_sold, rating, review_count,
    discounted_price, total_revenue
FROM amazon_sales_dataset;





INSERT INTO Products (product_id, product_category, rating, review_count)
SELECT DISTINCT
    product_id,
    product_category,
    rating,
    review_count
FROM amazon_sales_dataset;



INSERT INTO Orders (order_id, order_date, customer_region, payment_method)
SELECT DISTINCT
    order_id,
    order_date,
    customer_region,
    payment_method
FROM amazon_sales_dataset;


INSERT INTO Order_Items (
    order_id, product_id, price, discount_percent,
    quantity_sold, discounted_price, total_revenue
)
SELECT
    order_id,
    product_id,
    price,
    discount_percent,
    quantity_sold,
    discounted_price,
    total_revenue
FROM amazon_sales_dataset;



