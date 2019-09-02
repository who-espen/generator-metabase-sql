SELECT 
  concat(p_cluster_id, ' - ', cluster_name) as cluster,  
  sum(CASE WHEN d_lab_ov16 like 'Positive' THEN 1 ELSE 0 END)*100/count(id) "RDT % of positives",
  sum(dbs_positivity)*100/count(id) "ELISA % of positives"

FROM joint_participants_cluster_view_name
 [[WHERE upper(p_euid) = upper({{p_euid}})]]

GROUP BY cluster
ORDER BY cluster