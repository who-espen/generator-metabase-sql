/*
 * File: 3_river_assessemnt_dataset.sql
 * File Created: Monday, 4th May 2020 1:52:52 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 1:56:38 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will return a table with all raw data related to the ESPEN Collect river assessment forms.
 * Variable to rename <%v_bf_lf_bsa_2_river_insp%>
 */
SELECT * FROM <%v_bf_lf_bsa_2_river_insp%>
WHERE id IS NOT NULL
-- Metabase filter --
-- [[and {{r_site_name}}]]
-- [[and {{r_date}}]]

