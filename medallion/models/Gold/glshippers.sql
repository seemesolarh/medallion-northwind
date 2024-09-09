{{ config(materialized='table') }}
SELECT 
     slsh."shipperId",
     slsh."companyName",
     slsh."phone"
From 
     slshippers AS slsh
ORDER BY 
        slsh."shipperId" asc