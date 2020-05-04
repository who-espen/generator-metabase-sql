/*
 * File: river_site_view.sql
 * File Created: Monday, 4th May 2020 1:08:24 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 1:16:26 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * Variable to rename <%v_bf_lf_bsa_2_river_insp%>, <%bf_lf_bsa_2_river_insp%>
 */
 CREATE VIEW <%v_bf_lf_bsa_2_river_insp%>
  AS
SELECT
  id,
  r_recorder_id,
  r_county,
  r_district_id,
  r_site_name,
  r_date,
  r_gps_lat,
  r_gps_lng,
  r_gps_acc,
  CASE WHEN r_river_name = 'Other river' THEN r_river_name_other ELSE r_river_name END AS r_river_name,
  r_river_basin,
  r_site_suitable,
  r_evidence_of_larvae,
  r_larvae_rate,
  r_notes
FROM <%bf_lf_bsa_2_river_insp%> r;
