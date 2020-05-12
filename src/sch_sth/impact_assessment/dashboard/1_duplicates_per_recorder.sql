/*
 * File: 1_duplicates_per_recorder.sql
 * File Created: Monday, 11th May 2020 7:56:23 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 12th May 2020 9:40:39 am
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * A query to display the number of duplicates per recorder
 * Variable to rename <%metabase_sch_sth_ias_duplicates_202005%>, <%ab_cde_fgh_3_kk%>, <%v_ab_cde_fgh_4_urine%>
 */
 SELECT

  "Recorders",
  sum("# Duplicates")

FROM (
  SELECT

    k.k_recorder_id "Recorders",
    count(m.id) "# Duplicates",
    k_district district,
    k_cluster_id cluster_id,
    k_cluster_name cluster_name

    FROM public.<%metabase_sch_sth_ias_duplicates_202005%> m
    JOIN <%ab_cde_fgh_3_kk%> k ON k.id = m.id_results_kk

    GROUP BY k.k_recorder_id, k_district, k_cluster_id, k_cluster_name

  UNION

  SELECT

    p.p_recorder_id "Recorders",
    count(m.id) "# Duplicates",
   	p_district district,
   	p_cluster_id cluster_id,
   	p_cluster_name cluster_name, p_district, p_cluster_id, p_cluster_name

    FROM public.<%metabase_sch_sth_ias_duplicates_202005%> m
    JOIN <%ab_cde_fgh_2_participant%> p ON (p.id = m.id_participant)

  group by p.p_recorder_id

  UNION

   SELECT

    u.u_recorder_id "Recorders",
    count(m.id) "# Duplicates",
    u_district district,
    u_cluster_id cluster_id,
    u_cluster_name cluster_name

    FROM public.<%metabase_sch_sth_ias_duplicates_202005%> m
    JOIN <%v_ab_cde_fgh_4_urine%> u ON u.id = m.id_results_urine

    GROUP BY u.u_recorder_id, u_district, u_cluster_id, u_cluster_name

  UNION

) src

WHERE "Recorders" IS NOT NULL
------ Metabase filter -------
-- [[and {{district}}]]
-- [[and {{cluster_id}}]]
-- [[and {{cluster_name}}]]

GROUP BY "Recorders"

ORDER BY "# Dulicates" DESC
