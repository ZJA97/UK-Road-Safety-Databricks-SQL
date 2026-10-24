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
ORDER BY fatal_rank