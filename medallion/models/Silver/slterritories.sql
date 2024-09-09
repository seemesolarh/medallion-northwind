{{ config(materialized='table') }}
select t."territoryId",
t."territoryDescription",
t."regionId"
from {{ref("brterritories")}} as t