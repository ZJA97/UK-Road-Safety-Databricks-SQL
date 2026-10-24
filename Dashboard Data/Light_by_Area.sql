SELECT light_conditions, urban_rural,
       COUNT(*) AS accidents,
       ROUND(100.0 * SUM(CASE WHEN severity IN ('Fatal','Serious') THEN 1 ELSE 0 END) / COUNT(*), 2) AS fatal_or_serious_pct
FROM road_safety.v_accidents
WHERE light_conditions <> 'Data missing or out of range'
  AND urban_rural <> 'Unallocated'
GROUP BY light_conditions, urban_rural
ORDER BY fatal_or_serious_pct DESC