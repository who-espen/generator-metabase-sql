
/*
 * File: 9_participant_per_village.sql
 * File Created: Saturday, 2nd May 2020 11:05:52 am
 * Author: Dyesse YUMBA
 * Last Modified: Saturday, 2nd May 2020 11:10:18 am
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will display the number of participants per village
 * Variable to rename <%ab_cde_fgh_1_cluster%>, <%v_ab_cde_fgh_3_participant%>
 */
SELECT
DISTINCT ON  (c_cluster_id1)
	c_recorder_id "Recorder ID",
	c_district_id "District",
	c_cluster_id1 "Cluster ID",
  c_cluster_name "Cluster Name",
	count (p.id) "Total Participants",
	c_village_pop "Total Population"

FROM <%ab_cde_fgh_1_cluster%> c
JOIN <%v_ab_cde_fgh_3_participant%> p ON p.p_cluster_id::INT = c.c_cluster_id1

WHERE id IS NOT NULL

  ------ Metabase filter -------
  -- [[and {{district}}]]
  -- [[and {{date}}]]

GROUP BY c_recorder_id, c_cluster_id1, c_district_id, c_village_pop
