SELECT 
p.id,
p_recorder_id,
r."RecorderName" recorder_name,
p_district_id,
p_euid,
p_cluster_id,
c."ClusterName" cluster_name,
CASE WHEN (p_cluster_id = '100' OR p_cluster_id = '200' OR p_cluster_id = '300' OR p_cluster_id = '400' OR p_cluster_id = '500' OR p_cluster_id = '350' OR p_cluster_id = '700' OR p_cluster_id = '800') THEN 'Yes' ELSE 'No' END "is_1st_line_cluster",
cl.c_gps_lat::TEXT,
cl.c_gps_lng::TEXT,
cl.c_village_pop,
cl.c_black_fly,
p_consent,
p_how_long_lived,
p_sex,
p_age_yrs,
p_travel,
p_ivm,
p_ivm_where,
p_barcode_id,
db_sample_id,
db_normalized_value,
db_positivity,
p.created_at

  FROM participant_table_name p
  INNER JOIN public.cluster c ON c."ClusterCode" = p.p_cluster_id::INT
  LEFT JOIN public.recorders r ON r."RecorderID" = p.p_recorder_id
  LEFT JOIN cluster_table_name cl ON cl.c_cluster_id1 = p.p_cluster_id::INT
  INNER join diagnostic_table_name dbs on dbs.db_barcode_id = p.p_barcode_id