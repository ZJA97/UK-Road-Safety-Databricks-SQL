SELECT COUNT(*) FROM road_safety.accidents_raw;

DESCRIBE road_safety.accidents_raw; 


SELECT 'accidents' AS tbl, COUNT(*) AS n FROM road_safety.accidents_raw
UNION ALL
SELECT 'casualties', COUNT(*) FROM road_safety.casualties_raw
UNION ALL
SELECT 'vehicles', COUNT(*) FROM road_safety.vehicles_raw;

SELECT table_name, column_name, data_type
FROM workspace.information_schema.columns
WHERE table_schema = 'road_safety'
ORDER BY table_name, ordinal_position;

SELECT table_name,
       concat_ws(', ', collect_list(concat(column_name, ' ', data_type))) AS cols
FROM workspace.information_schema.columns
WHERE table_schema = 'road_safety'
GROUP BY table_name
ORDER BY table_name;