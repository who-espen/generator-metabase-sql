SELECT 
  "ClusterCode",
  "ClusterName",
  cl.c_eu,
  -- Todo: Update filter for 1st line and second line villages.
  CASE WHEN ("ClusterCode" = '100' OR "ClusterCode" = '200' OR "ClusterCode" = '300' 
        OR "ClusterCode" = '350' OR "ClusterCode" = '400' OR "ClusterCode" = '500'  
        OR "ClusterCode" = '700'  OR "ClusterCode" = '800') THEN 'Yes' ELSE 'No' END as "Is 1st line?"
FROM public.cluster c
  RIGHT JOIN cluster_table_name cl ON cl.c_cluster_id1 = c."ClusterCode"
  [[ where upper(cl.c_eu) = upper({{eu}})]]