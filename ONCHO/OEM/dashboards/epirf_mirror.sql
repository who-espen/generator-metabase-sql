select * from 
(
SELECT
  'Mapping - Individual level' "Type of survey",
  'Brong Ahafo' "State",
  REPLACE( p_district_id, RIGHT(p_district_id, 6), '') "Name of administrative level 2",
  c."ClusterName" "Name of community surveyed",
  'August' "Month",
  '2018' "Year",
  ROUND(cl.c_gps_lat, 5)::TEXT "Latitude",
  ROUND(cl.c_gps_lng, 5)::TEXT "Longitude",
  'ELISA' "Diagnostic for serology",
  CASE WHEN (p.p_cluster_id = '100' OR p.p_cluster_id = '200' OR p.p_cluster_id = '300' OR p.p_cluster_id = '350') THEN 'Convenient' ELSE 'Cluster' END "Sampling Methods",

  COUNT(r.db_barcode_id) "Number of people examined",
  CONCAT(MIN(p.p_age_yrs), ' - ', MAX(p.p_age_yrs) ) "Age Range (Age Min - Age Max)",
  COUNT(CASE WHEN db_positivity = 1 THEN 1 ELSE NULL END) "Positive",
  COUNT(CASE WHEN db_positivity = 1 THEN 1 ELSE NULL END)*100/COUNT(p.p_barcode_id)::decimal "% Positive"
  

FROM participant_table_name p
  INNER JOIN public.cluster c ON (c."ClusterCode" = p.p_cluster_id::INT)
  INNER JOIN cluster_table_name cl ON (cl.c_cluster_id1 = p.p_cluster_id::INT)
  INNER JOIN diagnostic_table_name r ON (r.db_barcode_id = p.p_barcode_id )

WHERE p_district_id IS NOT NULL
[[and p.p_euid = upper({{eu}})]]

  GROUP BY "State", "Name of administrative level 2", "Name of community surveyed", "Month", "Latitude", "Longitude", "Sampling Methods"


--ORDER BY cl.c_cluster_id1
)src



order by src."Diagnostic for serology" desc, src."Name of administrative level 2", src."Sampling Methods" desc
