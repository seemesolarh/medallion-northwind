{{ config(materialized='table') }}
select sr."supplierId",
sr."companyName",
sr."contactName",
sr."contactTitle",
sr."address",
sr."city",
sr."postalCode",
sr."country",
sr."phone"
from {{ref("brsuppliers")}} as sr