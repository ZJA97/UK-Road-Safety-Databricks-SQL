SELECT dayofweek(accident_date) AS day_num, day_of_week, accident_hour, COUNT(*) AS accidents
FROM road_safety.v_accidents
WHERE accident_hour IS NOT NULL
GROUP BY dayofweek(accident_date), day_of_week, accident_hour