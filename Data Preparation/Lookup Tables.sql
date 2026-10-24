CREATE OR REPLACE TABLE road_safety.lkp_weather_conditions AS
SELECT * FROM VALUES
 (-1,'Data missing or out of range'),(1,'Fine no high winds'),(2,'Raining no high winds'),
 (3,'Snowing no high winds'),(4,'Fine + high winds'),(5,'Raining + high winds'),
 (6,'Snowing + high winds'),(7,'Fog or mist'),(8,'Other'),(9,'Unknown') AS t(code, label);

CREATE OR REPLACE TABLE road_safety.lkp_road_surface_conditions AS
SELECT * FROM VALUES
 (-1,'Data missing or out of range'),(1,'Dry'),(2,'Wet or damp'),(3,'Snow'),
 (4,'Frost or ice'),(5,'Flood over 3cm deep'),(6,'Oil or diesel'),(7,'Mud') AS t(code, label);

 CREATE OR REPLACE VIEW road_safety.v_accidents AS
SELECT
  a.Accident_Index,
  to_date(a.Date, 'dd/MM/yyyy')            AS accident_date,
  year(to_date(a.Date, 'dd/MM/yyyy'))      AS accident_year,
  try_cast(substring(a.Time, 1, 2) AS INT) AS accident_hour,
  dow.label                                AS day_of_week,
  sev.label                                AS severity,
  a.Number_of_Vehicles,
  a.Number_of_Casualties,
  a.Speed_limit,
  pf.label                                 AS police_force,
  lad.label                                AS local_authority,
  rt.label                                 AS road_type,
  rc1.label                                AS road_class_1st,
  COALESCE(rc2.label, 'Data missing')      AS road_class_2nd,
  jd.label                                 AS junction_detail,
  lc.label                                 AS light_conditions,
  w.label                                  AS weather,
  rs.label                                 AS road_surface,
  ur.label                                 AS urban_rural,
  a.Latitude,
  a.Longitude
FROM road_safety.accidents_raw a
LEFT JOIN road_safety.accident_severity sev        ON a.Accident_Severity = sev.code
LEFT JOIN road_safety.day_of_week dow              ON a.Day_of_Week = dow.code
LEFT JOIN road_safety.police_force pf              ON a.Police_Force = pf.code
LEFT JOIN road_safety.local_authority_district lad ON a.`Local_Authority_(District)` = lad.code
LEFT JOIN road_safety.road_type rt                 ON a.Road_Type = rt.code
LEFT JOIN road_safety.road_class rc1               ON a.`1st_Road_Class` = rc1.code
LEFT JOIN road_safety.road_class rc2               ON a.`2nd_Road_Class` = rc2.code
LEFT JOIN road_safety.junction_detail jd           ON a.Junction_Detail = jd.code
LEFT JOIN road_safety.light_conditions lc          ON a.Light_Conditions = lc.code
LEFT JOIN road_safety.lkp_weather_conditions w     ON a.Weather_Conditions = w.code
LEFT JOIN road_safety.lkp_road_surface_conditions rs ON a.Road_Surface_Conditions = rs.code
LEFT JOIN road_safety.urban_rural ur               ON a.Urban_or_Rural_Area = ur.code;