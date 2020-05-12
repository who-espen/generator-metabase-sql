/*
 * File: 5_first_line_village.sql
 * File Created: Monday, 4th May 2020 1:59:00 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 2:00:56 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will return a table with all raw data related to the ESPEN Collect 1st line village forms
 * Variable to rename <%v_bf_lf_bsa_2_village%>
 */
SELECT * FROM <%v_bf_lf_bsa_2_village%>
WHERE id IS NOT NULL
-- Metabase filter --
-- [[and {{v_village}}]]
-- [[and {{v_date}}]]
