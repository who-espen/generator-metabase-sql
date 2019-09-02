SELECT 
  DISTINCT
  c_gps_lat, 
  c_gps_lng, 
  c_recorder_id, 
  c_eu, 
  c_cluster_id1, 
  c_cluster_id2, 
  c_village_pop,
  c_black_fly, 
  c_cluster_notes FROM participant_table_name p

  INNER JOIN cluster_table_name c on c.c_cluster_id1::TEXT = p.p_cluster_id
  LEFT JOIN diagnostic_table_name r ON r.d_barcode_id = p.p_barcode_id

  WHERE d_lab_ov16 = 'Positive'
[[and c_eu = upper({{eu}})]]