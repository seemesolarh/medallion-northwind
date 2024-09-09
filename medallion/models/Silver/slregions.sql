{{ config(materialized='table') }}
select r."regionId",
 r."regionDescription"
from {{ref("brregions")}} as r