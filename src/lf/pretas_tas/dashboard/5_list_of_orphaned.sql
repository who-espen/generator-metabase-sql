/*
 * File: 5_list_of_orphaned.sql
 * File Created: Tuesday, 5th May 2020 6:29:42 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 5th May 2020 6:33:56 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * A query for listing all records that use the same ID twice
 * Variable to rename <%v_ab_cde_fgh_2_participant%>, <%v_ab_cde_fgh_3_fts%>, <%metabase_lf_tas_orphaned_202005%>
 */

    SELECT
      p.p_cluster_id "Clustrer ID",
      NULL "Cluster Name",
      p_barcode_id "Barcode ID",
      p_recorder_id "Recorder ID",
      p_age_yrs "Age In Years",
      p_sex "Sex",
      NULL "Diagnostic Results",
      'Participant data' "Missing Record",
      p_date "Date",
      status "Status"

    FROM <%v_ab_cde_fgh_2_participant%> p
      LEFT JOIN <%v_ab_cde_fgh_3_fts%> d on p.p_barcode_id = d.d_barcode_id
      LEFT JOIN <%metabase_lf_tas_orphaned_202005%> m on m.id_participant = p.id
      WHERE d.id isNULL

  ------ Metabase filter -------
  -- [[and {{cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]

    UNION ALL

    SELECT
      d_cluster_id "Clustrer ID",
      NULL "Cluster Name",
      d_barcode_id "Barcode ID",
      d_recorder_id::int "Recorder ID",
      NULL "Age In Years",
      NULL "Sex",
      d_final_result "Diagnostic Results",
      'FTS results' "Missing Record",
      d_date "Date",
      status "Status"

    FROM <%v_ab_cde_fgh_3_fts%> d
      LEFT JOIN <%v_ab_cde_fgh_2_participant%> p on p.p_barcode_id = d.d_barcode_id
      LEFT JOIN <%metabase_lf_tas_orphaned_202005%> m on m.id_results = d.id
      WHERE p.id isNULL

  ------ Metabase filter -------
  -- [[and {{cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]
