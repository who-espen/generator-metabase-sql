

/*
 * This query will display the number of positives and the percentage of positives in 1st line clusters and second-line clusters
 * Variable to rename <%v_ab_cde_fgh_2_participant%>, <%v_ab_cde_fgh_3_fts%>
 */
 SELECT
	CONCAT(COUNT(CASE WHEN d_final_result = 'Positive' THEN 1 ELSE NULL END),' (', count(CASE WHEN d_final_result = 'Positive' THEN 1 ELSE NULL END) * 100 / COUNT(*), ' %)')
FROM <%v_ab_cde_fgh_2_participant%> p
  LEFT JOIN <%v_ab_cde_fgh_3_fts%> d on d.d_barcode_id = p.p_barcode_id
  WHERE p.id IS NOT NULL

  ------ Metabase filter -------
  -- [[and {{c_cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]
