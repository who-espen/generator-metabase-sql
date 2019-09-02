 select p_cluster_id as "Cluster ID", 
  CASE WHEN (p_cluster_id = '100' OR p_cluster_id = '200' OR p_cluster_id = '300' 
        OR p_cluster_id = '350' OR p_cluster_id = '400' OR p_cluster_id = '500'  
        OR p_cluster_id = '700'  OR p_cluster_id = '800') THEN 'Yes' ELSE 'No' END as "Is 1st line?",
  count(distinct p_barcode_id) as "# Participants" ,
  p_sex as "Gender"
  from participant_table_name
    where p_sex is not null and p_sex <>''
    [[and  upper(p_euid) = upper({{eu}})]]
  group by p_cluster_id, p_sex having p_sex notnull