{{ config(materialized='table') }}
SELECT 
    glod."orderID", 
    glod."productID",
    SUM(quantity) AS total_quantity,
    SUM(discount) AS total_discount,
    SUM(glod."unitPrice" * quantity * (1 - discount)) AS total_revenue,
    AVG(glod."unitPrice") AS average_unit_price
FROM slordersdetails as glod
    
GROUP BY 
    glod."orderID", glod."productID"
LIMIT 
     20