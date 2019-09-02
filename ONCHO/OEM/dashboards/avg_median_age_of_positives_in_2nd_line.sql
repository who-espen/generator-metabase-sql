
select CONCAT(AVG(p_age_yrs)::int, ' (', median(p_age_yrs)::int, ')')
  
  from joint_participants_cluster_view_name
  -- Cluster ID filter conditions
  -- TODO: Update the cluster ID filter
where (p_cluster_id <> '100' AND p_cluster_id <> '200' AND p_cluster_id <> '300' AND p_cluster_id <> '400' AND p_cluster_id <> '500'
 AND p_cluster_id <> '350' AND p_cluster_id <> '700' AND p_cluster_id <> '800')
 -- TODO: Udate positive conditions
   and d_lab_ov16 = 'Positive'
[[AND (upper(p_euid) = upper({{eu}}))]]