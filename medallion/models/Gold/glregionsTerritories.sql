{{ config(materialized='table') }}
SELECT
     count(slre."regionId") as regionid, 
     slre."regionDescription",
	 slte."territoryId",
     slte."territoryDescription"
FROM 
      slregions AS slre
JOIN
      slterritories AS slte 
ON 
     slre."regionId" = slte."regionId"
GROUP BY
        slre."regionDescription",
	    slte."territoryId",
        slte."territoryDescription"
LIMIT 10