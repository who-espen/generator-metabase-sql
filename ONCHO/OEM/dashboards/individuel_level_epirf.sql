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
  1 "Number of people examined",  
  CASE WHEN p.p_age_yrs < 20 THEN '< 20'
       WHEN p.p_age_yrs BETWEEN 20 AND 34 THEN '20 - 34'
       WHEN p.p_age_yrs BETWEEN 35 AND 49 THEN '35 - 49'
       WHEN p.p_age_yrs >= 50 THEN '>= 50' END AS "Age group surveyed(Min - Max)",
  (CASE WHEN r.db_positivity = 1 THEN 1 ELSE 0 END) "Positive",
  (CASE WHEN p.p_sex = 'Female' THEN 'F' ELSE 'M' END) "% Female",
  (CASE WHEN r.db_positivity = 1 THEN 100 ELSE 0 END) "% Positive"
  

FROM participant_table_name p
  INNER JOIN public.cluster c ON (c."ClusterCode" = p.p_cluster_id::INT)
  INNER JOIN cluster_table_name cl ON (cl.c_cluster_id1 = p.p_cluster_id::INT)
  INNER JOIN diagnostic_table_name r ON (r.db_barcode_id = p.p_barcode_id )

WHERE p_district_id IS NOT NULL

[[and p.p_euid = upper({{eu}})]]
--ORDER BY cl.c_cluster_id1
)src



order by src."Diagnostic for serology" desc, src."Name of administrative level 2", src."Sampling Methods" desc
