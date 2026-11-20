CREATE DATABASE IF NOT EXISTS financial_analytics;
USE financial_analytics;

CREATE TABLE financial_data (
    order_date DATE,
    invoice_no VARCHAR(50),
    customer_id VARCHAR(50),
    customer VARCHAR(150),
    product_id VARCHAR(50),
    product VARCHAR(150),
    category VARCHAR(100),
    segment VARCHAR(50),
    quantity INT,
    unit_cost DECIMAL(12,2),
    unit_price DECIMAL(12,2),
    revenue DECIMAL(14,2),
    cost DECIMAL(14,2),
    margin DECIMAL(14,2),
    ship_date DATE
);



DESCRIBE financial_data;

SELECT COUNT(*) 
FROM financial_data;


SELECT * 
FROM financial_data
LIMIT 5;

SELECT
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(margin) AS total_profit,
    ROUND(
        (SUM(margin) / SUM(revenue)) * 100, 2
    ) AS profit_margin_pct
FROM financial_data;




SELECT
    category,
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(margin) AS total_profit,
    ROUND(
        (SUM(margin) / SUM(revenue)) * 100, 2
    ) AS profit_margin_pct
FROM financial_data
GROUP BY category
ORDER BY total_revenue DESC;



SELECT
    segment,
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(margin) AS total_profit,
    ROUND(
        (SUM(margin) / SUM(revenue)) * 100, 2
    ) AS profit_margin_pct
FROM financial_data
GROUP BY segment
ORDER BY total_revenue DESC;




SELECT
    customer,
    SUM(revenue) AS total_revenue
FROM financial_data
GROUP BY customer
ORDER BY total_revenue DESC
LIMIT 5;

SELECT
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 2)
        AS avg_shipping_days,
    MIN(DATEDIFF(ship_date, order_date))
        AS min_shipping_days,
    MAX(DATEDIFF(ship_date, order_date))
        AS max_shipping_days
FROM financial_data;




