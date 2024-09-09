{{ config(materialized='table') }}
WITH customer_orders AS (
    SELECT 
        o."customerId",
        o."orderId",
        MIN(o."orderDate") OVER (PARTITION BY o."customerId") AS first_order_date,
        o."orderDate",
        (o."orderDate" - MIN(o."orderDate") OVER (PARTITION BY o."customerId"))::int AS days_since_first_order,
        od."productID",
        SUM(od."quantity") AS total_quantity,
        SUM(od."discount") AS total_discount,
        SUM(od."unitPrice" * od."quantity" * (1 - od."discount")) AS total_revenue,
        AVG(od."unitPrice") AS average_unit_price
    FROM 
        slorders AS o
    JOIN 
        slordersdetails AS od ON o."orderId" = od."orderID"
    GROUP BY 
        o."customerId", o."orderId", o."orderDate", od."productID"
)
SELECT
    co."customerId",
    co."orderId",
    co."productID",
    co."first_order_date",
    co."orderDate",
    co."days_since_first_order",
    co."total_quantity",
    co."total_discount",
    co."total_revenue",
    co."average_unit_price"
FROM
    customer_orders AS co
LIMIT 20