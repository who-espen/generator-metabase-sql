/*
 * File: 12_school_map.sql
 * File Created: Tuesday, 12th May 2020 2:01:53 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 12th May 2020 2:04:26 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will use the GPS data to display a pin map of clusters.
 * Variable to rename <%v_ab_cde_fgh_1_school%>
 */
SELECT

  w_region,
  w_district,
  w_school_id,
  w_school_name,
  w_gps_lat,
  w_gps_lng

FROM <%v_ab_cde_fgh_1_school%>
WHERE w_gps_lat IS NOT NULL
  ------ Metabase filter -------
  -- [[and {{c_cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]

