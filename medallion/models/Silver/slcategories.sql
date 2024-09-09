{{ config(materialized='table') }}
select  cat."categoryId", 
cat."categoryName", 
cat."description"
from {{ref("brcategories")}} as cat
