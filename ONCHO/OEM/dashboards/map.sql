select 
c_gps_lat, c_gps_lng, c_recorder_id, c_eu, c_cluster_id1, c_cluster_id2, c_village_pop, c_black_fly, c_cluster_notes from cluster_table_name
where c_gps_lat is not null
[[and c_eu = upper({{eu}})]]