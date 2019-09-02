select * from ((
WITH src AS (

select 
  p_cluster_id,
  round(COUNT(CASE WHEN dbs_positivity = 1 THEN 1 ELSE NULL END)*100/COUNT(p_barcode_id)::decimal,2) prev
  
  from joint_participants_cluster_view_name  
  -- Cluster ID filter conditions
  -- TODO: Update the cluster ID filter
where (p_cluster_id = '100' OR p_cluster_id = '200' OR p_cluster_id = '300' OR p_cluster_id = '400' OR p_cluster_id = '500' OR p_cluster_id = '350' OR p_cluster_id = '700' OR p_cluster_id = '800')
 [[and upper(p_euid) = upper({{p_euid}})]]

  group by p_cluster_id)

  SELECT 
    'ELISA 1st Line' Designation,
    max(src.prev) "Max Prev",  
    min(src.prev) "Min Prev"
  
  FROM src
)

union

(
WITH src AS (

select 
  p_cluster_id,
  round(COUNT(CASE WHEN dbs_positivity = 1 THEN 1 ELSE NULL END)*100/COUNT(p_barcode_id)::decimal,2) prev
  
  from joint_participants_cluster_view_name

  -- Cluster ID filter conditions
  -- TODO: Update the cluster ID filter
where (p_cluster_id <> '100' AND p_cluster_id <> '200' AND p_cluster_id <> '300' AND p_cluster_id <> '400' AND p_cluster_id <> '500' AND p_cluster_id <> '350' AND p_cluster_id <> '700' AND p_cluster_id <> '800')
 [[and upper(p_euid) = upper({{p_euid}})]]

  group by p_cluster_id)

  SELECT 
    'ELISA 2nd Line' Designation,
    max(src.prev) "Max Prev",  
    min(src.prev) "Min Prev"
  
  FROM src
)) s

order by Designation