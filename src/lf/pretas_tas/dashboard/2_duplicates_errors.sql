/*
 * File: 2_duplicates_errors.sql
 * File Created: Tuesday, 5th May 2020 3:57:42 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 5th May 2020 5:06:34 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * A query for listing all records that use the same ID twice
 * Variable to rename <%metabase_lf_tas_duplicates_202005%>, <%v_ab_cde_fgh_2_participant%>, <%v_ab_cde_fgh_3_fts%>
 */
SELECT
  "Form",
  cluster_id,
  cluster_name,
  "Barcode ID",
  "Recorder ID",
  "Age in Years",
  "Year lived in the village",
  "Sex",
  "Final result",
  date,
  "Status"

FROM (
  SELECT
  m.form "Form",
  p.p_cluster_id cluster_id,
  p.p_cluster_name cluster_name,
  m.barcode_participant "Barcode ID",
  p.p_recorder_id "Recorder ID",
  p.p_age_yrs "Age in Years",
  p.p_how_long_lived "Year lived in the village",
  p.p_sex "Sex",
  null "Final result",
  p.p_date date,
  status "Status"

FROM <%metabase_lf_tas_duplicates_202005%> AS m, <%v_ab_cde_fgh_2_participant%> AS p
  WHERE p.id = m.id_participant

UNION ALL

SELECT
  m.form "Form",
  d.d_cluster_id cluster_name,
  d.d_cluster_name cluster_name,
  m.barcode_results "Barcode ID",
  d.d_recorder_id "Recorder ID",
  null "Age in Years",
  null "Year lived in the village",
  null "Sex",
  d_final_result "Final result",
  d.d_date date,
  status "Status"

FROM <%metabase_lf_tas_duplicates_202005%> AS m, <%v_ab_cde_fgh_3_fts%> AS d
  WHERE d.id = m.id_results
) src

WHERE "Form" IS NOT NULL
------ Metabase filter -------
-- [[and {{cluster_id}}]]
-- [[and {{cluster_name}}]]
-- [[and {{district}}]]
-- [[and {{date}}]]
