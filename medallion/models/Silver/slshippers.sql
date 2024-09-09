{{ config(materialized='table') }}
select sh."shipperId",
 sh."companyName",
  sh."phone"
from {{ref("brshippers")}} as sh