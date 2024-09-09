{{ config(materialized='table') }}
select c."customerId", 
       c."companyName",
	   c."contactName",
       c."contactTitle",
	   c."address",
	   c."city",
	   c."postalCode",
	   c."country",
	   c."phone"
	   from {{ref("brcustomers")}} as c