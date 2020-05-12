/*
 * File: 17_epirf_mirror.sql
 * File Created: Saturday, 2nd May 2020 4:22:43 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 11th May 2020 1:09:58 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * This query is a sample of EPIRF mirror
 * Variable to rename <%v_ab_cde_fgh_2_participant%>
 */
SELECT
  'Mapping' "Survey Type",
  c.c_region "State/Province/Region",
  c.c_district_id "Implementation Unit",
  c.c_cluster_name "Community Surveyed",
  TO_CHAR(c.created_at, 'Month') "Month",
  EXTRACT(YEAR FROM c.created_at) "Year",
  c_gps_lat "Latitude",
  c_gps_lng "Longitude",
  NULL "Date Of the 1st PC Round", -- Ask the programm manageger this information
  NULL "Treatment Strategy",-- Ask the programm manageger this information
  NULL "Pre-control Prevalence", -- Ask the programm manageger this information
  'RDT' "Diagnostic for Serology",
  'Convinent' "Sampling Method", -- cluster for 2nd line village
  CONCAT(min(p_age_yrs), ' - ', max(p_age_yrs)) "Age group(Min - Max)",
  COUNT(p.id) "Examined",
  COUNT(case when d_lab_ov16 = 'Positive' then 1 else NULL end) "Number of Positive",
  ROUND(COUNT(case when d_lab_ov16 = 'Positive' then 1 else NULL end) * 100.0 / count(*), 2) "% positive"

FROM <%v_ab_cde_fgh_2_participant%> p
LEFt JOIN <%v_ab_cde_fgh_1_cluster%> c on c.c_cluster_id1 = p.p_cluster_id::int
LEFt JOIN <%v_ab_cde_fgh_3_rdt_ov16%> d on d.d_barcode_id = p.p_barcode_id

WHERE p.is IS NOT NULL

  ------ Metabase filter -------
  -- [[and {{c_cluster_id}}]]
  -- [[and {{cluster_name}}]]
  -- [[and {{district}}]]
  -- [[and {{date}}]]

GROUP BY  "State/Province/Region", "Implementation Unit", "Community Surveyed", "Month", "Year", c_gps_lat, c_gps_lng

