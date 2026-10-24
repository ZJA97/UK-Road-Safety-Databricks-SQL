# UK Road Safety Analysis (2005–2015) — Databricks SQL

An end-to-end SQL project in Databricks: loading 31 CSV files into Delta tables, validating and joining them, analysing 1.78 million police-reported road collisions, and presenting the results in an AI/BI dashboard.

**Dashboard preview:** [Dashboard screenshot (PDF)](Dashboard/Dashboard-Screenshot.pdf)

<!-- To show the dashboard directly on this page, add a PNG to an "images" folder and uncomment the line below:
![Dashboard overview](images/dashboard-overview.png)
-->

## The question

How have road collisions in Great Britain changed between 2005 and 2015, and which conditions (light, location, road user, area) are linked to the most serious outcomes?

## Data

- **Source:** [UK Car Accidents 2005–2015 on Kaggle](https://www.kaggle.com/datasets/silicon99/dft-accident-data?select=contextCSVs). The data comes from the UK Department for Transport's STATS19 police collision records, published on data.gov.uk. Check the Kaggle page for licence terms.
- **Size:** 1,780,653 collisions, 3,262,270 vehicles and 2,402,909 casualties.
- **Structure:** three main tables (accidents, vehicles, casualties) plus 28 lookup files that decode the numeric codes (for example severity, light conditions, road type, police force). 31 CSVs in total.
- The raw CSVs are not included in this repository because of file size. Download them from the Kaggle link above.

## Key findings

- **Collisions fell by 29.5%**, from 198,735 in 2005 to 140,056 in 2015. The fall was not steady: collisions rose 5.5% in 2014.
- **Fatal collisions fell faster, by 44.5%** (2,913 to 1,616). Fatal or serious collisions together fell by 22.5%.
- **Overall**, 1.29% of collisions were fatal and 14.9% were fatal or serious.
- **Darkness on unlit rural roads is the most dangerous combination:** 24.1% of collisions on rural roads in darkness with no street lighting were fatal or serious, compared with 11.9% in urban daylight.
- **Older pedestrians are the most vulnerable:** 39.3% of pedestrian casualties aged over 75 were fatal or serious, compared with 18.5% of drivers and riders in the same age band. Across most age bands, pedestrians had roughly double the fatal-or-serious share of drivers and riders.
- **Rural areas have the highest share of fatal collisions.** Among districts with at least 2,000 collisions, the highest fatal shares were Harborough (4.3%), Aberdeenshire (4.2%), Cotswold (4.0%) and Highland (3.9%). In raw counts, Birmingham had the most fatal collisions (288), followed by Aberdeenshire (249) and Leeds (240), which mostly reflects population and traffic volume.
- **By police force**, the fatal share ranged from 3.08% (Grampian) to under 1% in forces such as Surrey, West Midlands and Merseyside (forces with at least 10,000 collisions only).

## Dashboard

The dashboard includes KPI counters, a yearly trend by severity, a day-by-hour heatmap, severity by light conditions and urban/rural setting, casualty severity by age and road-user type, a police force ranking, and maps of fatal collisions and the fatal share by district. It has Accident Year and Severity filters.

Note: the filters only affect charts built on collision-level data (the counters and trend chart). The other charts use pre-aggregated datasets covering all years 2005–2015.

## Data quality issues found and handled

| Issue | How I handled it |
|---|---|
| Rows from 2015 in the casualties file (186,189 rows) and vehicles file (257,845 rows) contain one more field than the header declares. | Confirmed the main columns still line up, so the extra field was ignored. It is captured in the `_rescued_data` column and not used. |
| Joining accidents → vehicles → casualties directly produced 4,650,859 rows, against 2,402,909 casualties (a join fan-out). | Joined casualties to vehicles on `Accident_Index` **and** `Vehicle_Reference`, and checked that the row count matched the casualties table. |
| No lookup files were supplied for weather conditions or road surface conditions. | Built small lookup tables from the DfT STATS19 guide. |
| `2nd_Road_Class = -1` (732,871 rows) has no match in the road class lookup. | Used `LEFT JOIN` with `COALESCE` so no rows are dropped. |
| One of the lookup files (`Road-Accident-Safety-Data-Guide.csv`) is a duplicate of the vehicle types. | Ignored it. |
| Dates are stored as text (dd/MM/yyyy) and 151 collisions have no time. | Parsed dates with `to_date`, and extracted the hour with `try_cast` so missing times become NULL. |

**Validation checks:** row counts after loading and after joins, no orphan casualties or vehicles, every accident has at least one vehicle and casualty, `Number_of_Casualties` matches the casualty rows, and each collision's severity equals its most severe casualty.

## SQL skills demonstrated

Multi-table joins (inner and left, composite keys), lookup-table decoding, views, CTEs, window functions (`LAG`, `RANK`), conditional aggregation, date parsing, data validation, and Databricks AI/BI dashboards with filters and map visualisations.

## Repository contents

```
├── Data Preparation/    Loading the CSVs into Delta tables, lookup tables, validation checks and analysis
│   ├── Load Tables.sql
│   ├── Lookup Tables.sql
│   ├── Confirm Loaded.sql
│   └── Analysis.sql
├── Dashboard Data/      The SQL behind each dashboard chart (one file per dashboard dataset)
│   ├── Accidents.sql
│   ├── KPI_Fatal_Share.sql
│   ├── Light_by_Area.sql
│   ├── Day_Hour.sql
│   ├── Force_Ranking.sql
│   ├── Casualty-Age.sql
│   └── Fatality_Share_Map.sql
└── Dashboard/
    ├── UK-Car-Accidents.lvdash.json    Exported dashboard (importable into Databricks)
    └── Dashboard-Screenshot.pdf
```

## How to reproduce

1. Download the CSVs from the Kaggle link above.
2. In Databricks, create a schema called `road_safety` and upload the CSVs to a volume.
3. Run the scripts in `Data Preparation` to load the tables, build the lookups and check the row counts.
4. Import `Dashboard/UK-Car-Accidents.lvdash.json` into Databricks, or recreate the charts from the queries in `Dashboard Data`.

## Limitations

- The data covers **police-reported injury collisions only**. Slight injuries are under-reported, so shares of "fatal or serious" collisions describe the collisions that were recorded, not all road incidents.
- Percentages are shares of collisions, **not risk per mile travelled** or per person. Raw counts by area mostly reflect population and traffic volume.
- The data ends in 2015 and does not reflect current road conditions or policy.
- The weather and road surface lookups were typed from the DfT STATS19 guide rather than supplied with the dataset.
