SELECT c.Age_Band_of_Casualty AS band_code, ab.label AS age_band, cc.label AS casualty_class,
       COUNT(*) AS casualties,
       ROUND(100.0 * SUM(CASE WHEN c.Casualty_Severity IN (1,2) THEN 1 ELSE 0 END) / COUNT(*), 2) AS fatal_or_serious_pct
FROM road_safety.casualties_raw c
LEFT JOIN road_safety.age_band ab       ON c.Age_Band_of_Casualty = ab.code
LEFT JOIN road_safety.casualty_class cc ON c.Casualty_Class = cc.code
GROUP BY c.Age_Band_of_Casualty, ab.label, cc.label