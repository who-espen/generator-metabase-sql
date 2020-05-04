/*
 * File: fts_view.sql
 * File Created: Monday, 4th May 2020 4:21:23 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 8:29:51 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * Variable to rename  <%v_ab_cde_fgh_3_fts%>, <%ab_cde_fgh_3_fts%>
 */
 CREATE view <%v_ab_cde_fgh_3_fts%>
AS
SELECT
  id,
  d_recorder_id,
  d_eu_code,
  d_cluster_id,

  CASE WHEN d_id_type = 'Scanner' THEN d_barcode_id ELSE d_generate_id END AS d_barcode_id,

  d_lotnumber1,
  d_result1,

  CASE WHEN d_why_invalid1 = 'Other' THEN d_why_invalid_other1 ELSE d_why_invalid1 END AS d_why_invalid1,

  d_display_result1,
  d_lotnumber2,
  d_result2,

  CASE WHEN d_why_invalid2 = 'Other' THEN d_why_invalid_other2 ELSE d_why_invalid_other2 END AS d_why_invalid2,

  d_display_result2,
  d_final_result,
  d_end

FROM <%ab_cde_fgh_3_fts%> d
