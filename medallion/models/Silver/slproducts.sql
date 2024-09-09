{{ config(materialized='table') }}
select p."productId",
p."productName",
p."supplierId", 
p."categoryId",
p."quantityPerUnit",
p."unitPrice",
p."unitsInStock",
P."unitsOnOrder",
p."reorderLevel",
p."discontinued"
from {{ref("brproducts")}} as p