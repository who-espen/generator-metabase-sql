
/*
 * This query will will display a pin Map of clusters with positive cases
 * Variable to rename <%ab_cde_fgh_1_cluster%>,  <%v_ab_cde_fgh_3_fts%>
 */
 SELECT
  c_district_id,
  c_cluster_id1,
  c_cluster_name,
  c_gps_lat,
  c_gps_lng,
  created_at

FROM <%ab_cde_fgh_1_site%> c
LEFT JOIN <%v_ab_cde_fgh_3_fts%> d c.c_cluster_id = d.cluster_id

where d_final_result = '<%Positive%>'

  ------ Metabase filter -------
  -- [[and {{c_cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]
