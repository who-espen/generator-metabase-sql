/*
 * File: 4_community_questiuon.sql
 * File Created: Monday, 4th May 2020 1:57:04 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 1:58:29 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will return a table with all raw data related to the ESPEN Collect community question forms
 * Variable to rename <%v_bf_lf_bsa_2_community_quest%>
 */
SELECT * FROM <%v_bf_lf_bsa_2_community_quest%>
WHERE id IS NOT NULL
-- Metabase filter --
-- [[and {{q_site_name}}]]
-- [[and {{q_date}}]]

