
/*
 * File: 1_duplicates_per_recorder.sql
 * File Created: Tuesday, 5th May 2020 3:50:42 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 5th May 2020 3:56:53 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * A query to display the number of duplicates per recorder
 * Variable to rename <%metabase_lf_tas_duplicates_202005%>? <%ab_cde_fgh_3_fts%>
 */
 SELECT

  "Recorders",
  sum("# Duplicates")

FROM (
  SELECT

    d.d_recorder_id "Recorders",
    count(m.id) "# Duplicates",
    d_district district,
    d_cluster_id cluster_id,
    d_cluster_name cluster_name

    FROM public.<%metabase_lf_tas_duplicates_202005%> m
    JOIN <%ab_cde_fgh_3_fts%> d ON d.id = m.id_results

    GROUP BY d.d_recorder_id, d_district, d_cluster_id, d_cluster_name

  UNION

  SELECT

    p.p_recorder_id "Recorders",
    count(m.id) "# Duplicates",
   	p_district district,
   	p_cluster_id cluster_id,
   	p_cluster_name cluster_name, p_district, p_cluster_id, p_cluster_name

    FROM public.<%metabase_lf_tas_duplicates_202005%> m
    JOIN <%ab_cde_fgh_2_participant%> p ON p.id = m.id_participant

  group by p.p_recorder_id

) src

WHERE "Recorders" IS NOT NULL
------ Metabase filter -------
-- [[and {{district}}]]
-- [[and {{cluster_id}}]]
-- [[and {{cluster_name}}]]

GROUP BY "Recorders"

ORDER BY "# Dulicates" DESC
