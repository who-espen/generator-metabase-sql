select
id,
c_recorder_id,
c_district_id,
c_eu,
c_cluster_id1,
c_cluster_id2,
CASE WHEN (c_cluster_id1 = '100' OR c_cluster_id1 = '200' OR c_cluster_id1 = '300' 
    OR c_cluster_id1 = '350' OR c_cluster_id1 = '400' OR c_cluster_id1 = '500'  
    OR c_cluster_id1 = '700'  OR c_cluster_id1 = '800') THEN 'Yes' ELSE 'No' END as "Is 1st line?",
c_gps_lat,
c_gps_lat,
c_gps_lng,
c_gps_alt,
c_gps_acc,
c_village_pop,
c_black_fly,
c_cluster_notes,
created_at 
  from cluster_table_name
[[where upper(c_eu) = upper({{eu}})]]
order by c_cluster_id1