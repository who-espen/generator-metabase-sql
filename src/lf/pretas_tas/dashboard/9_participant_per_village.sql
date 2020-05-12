
/*
 * File: 9_participant_per_village.sql
 * File Created: Tuesday, 5th May 2020 8:04:12 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 5th May 2020 8:06:16 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will display the number of participants per village
 * Variable to rename <%ab_cde_fgh_1_site%>, <%v_ab_cde_fgh_2_participant%>
 */
SELECT
DISTINCT ON  (c_cluster_id)
	c_recorder_id "Recorder ID",
	c_district_id "District",
	c_cluster_id "Cluster ID",
  c_cluster_name "Cluster Name",
	count (p.id) "Total Participants",
	c_village_pop "Total Population"

FROM <%ab_cde_fgh_1_site%> c
JOIN <%v_ab_cde_fgh_2_participant%> p ON p.p_cluster_id::INT = c.c_cluster_id

WHERE id IS NOT NULL

  ------ Metabase filter -------
  -- [[and {{district}}]]
  -- [[and {{date}}]]

GROUP BY c_recorder_id, c_cluster_id, c_district_id, c_village_pop
