/*
 * File: participant_view.sql
 * File Created: Monday, 4th May 2020 3:30:18 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 3:54:35 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * Variable to rename  <%ab_cde_fgh_2_participant%>, <%v_ab_cde_fgh_2_participant%>
 */
CREATE VIEW <%v_ab_cde_fgh_2_participant%>
AS
SELECT
  id,
  p_recorder_id,
  p_eu_code,
  p_cluster_name,
  p_cluster_id,
  p_consent,
  p_sex,
  p_age_yrs,
  p_how_long_lived,

  CASE WHEN p_id_method = 'Scanner' THEN p_barcode_id ELSE p_generate_id END AS p_barcode_id,

  p_notes,
  p_end p_date

FROM <%v_ab_cde_fgh_2_participant%> p
