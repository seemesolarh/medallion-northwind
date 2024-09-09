{{ config(materialized='table') }}
SELECT 
    o."orderId", 
    o."customerId",
    o."employeeId", 
    DATE(o."orderDate") AS "orderDate",
    DATE(o."requiredDate") AS "requiredDate", 
    DATE(o."shippedDate") AS "shippedDate",
    o."shipVia",
    o."freight",
    o."shipName",
    o."shipAddress",
    o."shipCity",
    o."shipPostalCode",
    o."shipCountry",
    DATE(o."shippedDate") - DATE(o."orderDate") AS "dayToShip",
    ROW_NUMBER() over (PARTITION BY o."customerId" ORDER BY o."orderDate") AS Transaction_no,
    MIN(o."orderDate") OVER (PARTITION BY o."customerId") as FirstTransactionDate
FROM {{ref("brorders")}} AS o
