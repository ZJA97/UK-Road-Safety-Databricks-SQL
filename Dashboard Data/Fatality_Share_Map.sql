SELECT local_authority,
       AVG(Latitude)  AS lat,
       AVG(Longitude) AS lon,
       COUNT(*)       AS collisions,
       SUM(CASE WHEN severity = 'Fatal' THEN 1 ELSE 0 END) AS fatal,
       ROUND(100.0 * SUM(CASE WHEN severity = 'Fatal' THEN 1 ELSE 0 END) / COUNT(*), 2) AS fatal_pct
FROM road_safety.v_accidents
WHERE Latitude IS NOT NULL AND Longitude IS NOT NULL
GROUP BY local_authority
HAVING COUNT(*) >= 2000
ORDER BY fatal_pct DESC