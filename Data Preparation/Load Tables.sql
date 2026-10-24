CREATE OR REPLACE TABLE road_safety.accidents_raw
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/Accidents0515.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.casualties_raw
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/Casualties0515.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.vehicles_raw
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/Vehicles0515.csv', format => 'csv', header => true); 


CREATE OR REPLACE TABLE road_safety.Accident_Severity
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Accident_Severity.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Age_Band
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Age_Band.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Casualty_Class
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Casualty_Class.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Casualty_Severity
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Casualty_Severity.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Casualty_Type
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Casualty_Type.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Day_of_Week
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Day_of_Week.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Journey_Purpose
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Journey_Purpose.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Junction_Control
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Junction_Control.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Junction_Detail
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Junction_Detail.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Junction_Location
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Junction_Location.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Light_Conditions
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Light_Conditions.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Local_Authority_District
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Local_Authority_District.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Local_Authority_Highway
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Local_Authority_Highway.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Cross_Human
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Cross_Human.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Cross_Physical
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Cross_Physical.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Location
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Location.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Movement
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Movement.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Point_of_Impact
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Point_of_Impact.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Police_Force
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Police_Force.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Police_Officer_Attend
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Police_Officer_Attend.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Road_Accident_Safety_Data_Guide
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Road-Accident-Safety-Data-Guide.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Road_Class
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Road_Class.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Road_Type
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Road_Type.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Sex_of_Driver
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Sex_of_Driver.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Urban_Rural
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Urban_Rural.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Vehicle_Location
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Vehicle_Location.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Vehicle_Manoeuvre
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Vehicle_Manoeuvre.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Vehicle_Type
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Vehicle_Type.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Age_Band
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Age_Band.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Casualty_Class
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Casualty_Class.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Casualty_Severity
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Casualty_Severity.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Casualty_Type
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Casualty_Type.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Day_of_Week
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Day_of_Week.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Journey_Purpose
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Journey_Purpose.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Junction_Control
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Junction_Control.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Junction_Detail
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Junction_Detail.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Junction_Location
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Junction_Location.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Light_Conditions
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Light_Conditions.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Local_Authority_District
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Local_Authority_District.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Local_Authority_Highway
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Local_Authority_Highway.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Cross_Human
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Cross_Human.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Cross_Physical
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Cross_Physical.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Location
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Location.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Ped_Movement
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Ped_Movement.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Point_of_Impact
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Point_of_Impact.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Police_Force
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Police_Force.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Police_Officer_Attend
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Police_Officer_Attend.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Road_Accident_Safety_Data_Guide
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Road-Accident-Safety-Data-Guide.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Road_Class
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Road_Class.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Road_Type
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Road_Type.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Sex_of_Driver
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Sex_of_Driver.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Urban_Rural
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Urban_Rural.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Vehicle_Location
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Vehicle_Location.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Vehicle_Manoeuvre
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/Vehicle_Manoeuvre.csv', format => 'csv', header => true); 

CREATE OR REPLACE TABLE road_safety.Vehicle_Type
TBLPROPERTIES ('delta.columnMapping.mode' = 'name', 'delta.minReaderVersion' = '2', 'delta.minWriterVersion' = '5')
AS SELECT * FROM read_files('/Volumes/workspace/road_safety/raw_files/contextCSVs/




Vehicle_Type.csv', format => 'csv', header => true); 
