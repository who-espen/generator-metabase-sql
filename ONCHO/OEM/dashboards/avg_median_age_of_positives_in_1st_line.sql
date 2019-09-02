
select CONCAT(AVG(p_age_yrs)::int, ' (', median(p_age_yrs)::int, ')')
  
  from joint_participants_cluster_view_name
  -- Cluster ID filter conditions
  -- TODO: Update the cluster ID filter
where (p_cluster_id = '100' OR p_cluster_id = '200' OR p_cluster_id = '300' OR p_cluster_id = '400' 
OR p_cluster_id = '500' OR p_cluster_id = '350' OR p_cluster_id = '700' OR p_cluster_id = '800')
[[  AND (upper(p_euid) = upper({{eu}}))]]