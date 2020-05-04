/*
 * File: 2_site_with_evidence_of_larvae.sql
 * File Created: Monday, 4th May 2020 1:50:46 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 1:52:23 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will be used for a pin Map for all river site visited with evidence of larvae.
 * Variable to rename <%v_bf_lf_bsa_2_village%>
 */
 SELECT
  r_recorder_id,
  r_county,
  r_district_id,
  r_site_name,
  r_date,
  r_gps_lat,
  r_gps_lng,
  r_gps_acc,
  r_river_name,
  r_river_basin,
  r_site_suitable,
  r_evidence_of_larvae,
  r_larvae_rate
FROM <%v_bf_lf_bsa_2_river_insp%>
WHERE r_evidence_of_larvae = 'Yes'
-- Metabase filter --
-- [[and {{r_site_name}}]]
-- [[and {{r_date}}]]
