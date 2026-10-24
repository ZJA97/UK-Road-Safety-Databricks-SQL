SELECT accident_year,
       COUNT(*) AS accidents,
       SUM(CASE WHEN severity = 'Fatal' THEN 1 ELSE 0 END) AS fatal,
       ROUND(100.0 * SUM(CASE WHEN severity = 'Fatal' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fatal_pct,
       ROUND(100.0 * (COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY accident_year))
             / LAG(COUNT(*)) OVER (ORDER BY accident_year), 1) AS yoy_pct
FROM road_safety.v_accidents
GROUP BY accident_year
ORDER BY accident_year;


SELECT vt.label AS vehicle_type, cs.label AS casualty_severity, COUNT(*) AS casualties
FROM road_safety.casualties_raw c
JOIN road_safety.vehicles_raw v
  ON c.Accident_Index = v.Accident_Index
 AND c.Vehicle_Reference = v.Vehicle_Reference
LEFT JOIN road_safety.vehicle_type vt      ON v.Vehicle_Type = vt.code
LEFT JOIN road_safety.casualty_severity cs ON c.Casualty_Severity = cs.code
GROUP BY vt.label, cs.label
ORDER BY casualties DESC;


--Does light and location affect severity?
SELECT light_conditions, urban_rural,
       COUNT(*) AS accidents,
       ROUND(100.0 * SUM(CASE WHEN severity IN ('Fatal','Serious') THEN 1 ELSE 0 END) / COUNT(*), 2) AS fatal_or_serious_pct
FROM road_safety.v_accidents
WHERE light_conditions <> 'Data missing or out of range'
GROUP BY light_conditions, urban_rural
ORDER BY fatal_or_serious_pct DESC;


--When do collisions happen?
SELECT dayofweek(accident_date) AS day_num, day_of_week, accident_hour, COUNT(*) AS accidents
FROM road_safety.v_accidents
WHERE accident_hour IS NOT NULL
GROUP BY dayofweek(accident_date), day_of_week, accident_hour;


--Which police forces have the highest fatal share?
WITH force_stats AS (
  SELECT police_force,
         COUNT(*) AS accidents,
         SUM(CASE WHEN severity = 'Fatal' THEN 1 ELSE 0 END) AS fatal
  FROM road_safety.v_accidents
  GROUP BY police_force
)
SELECT police_force, accidents, fatal,
       ROUND(100.0 * fatal / accidents, 2) AS fatal_pct,
       RANK() OVER (ORDER BY 1.0 * fatal / accidents DESC) AS fatal_rank
FROM force_stats
WHERE accidents >= 10000
ORDER BY fatal_rank;


--Who is most affected?
SELECT c.Age_Band_of_Casualty AS band_code, ab.label AS age_band, cc.label AS casualty_class,
       COUNT(*) AS casualties,
       ROUND(100.0 * SUM(CASE WHEN c.Casualty_Severity IN (1,2) THEN 1 ELSE 0 END) / COUNT(*), 2) AS fatal_or_serious_pct
FROM road_safety.casualties_raw c
LEFT JOIN road_safety.age_band ab       ON c.Age_Band_of_Casualty = ab.code
LEFT JOIN road_safety.casualty_class cc ON c.Casualty_Class = cc.code
GROUP BY c.Age_Band_of_Casualty, ab.label, cc.label
ORDER BY band_code, casualty_class;
