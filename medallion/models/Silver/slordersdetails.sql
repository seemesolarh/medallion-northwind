{{ config(materialized='table') }}
select slod."orderID",
       slod."productID",
	   slod."unitPrice",
	   slod."quantity",
	   slod."discount"
from {{ref("brordersdetail")}} as  slod