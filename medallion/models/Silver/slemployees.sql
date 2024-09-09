{{ config(materialized='table') }}
select emp."employeeId", 
       emp."titleOfCourtesy" || ' ' || emp."firstName" || ' ' || emp."lastName" as fullName, 
       emp."title",
       emp."birthDate", 
       emp."hireDate", 
       emp."address", 
       emp."city", 
       emp."postalCode", 
       emp."country", 
       emp."homePhone",
       emp."extension"
from {{ref("bremployees")}} as emp