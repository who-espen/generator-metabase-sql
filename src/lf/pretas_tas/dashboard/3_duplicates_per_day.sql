
/*
 * File: 3_duplicates_per_day.sql
 * File Created: Tuesday, 5th May 2020 5:05:43 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 5th May 2020 5:12:53 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * A query to display the total records of duplicates per day
 * Variable to rename <%metabase_lf_tas_duplicates_202005%>, <%ab_cde_fgh_3_fts%>, <%ab_cde_fgh_2_participant%>
 */
 SELECT
 COUNT(barcode_participant),
 p.p_end::date
FROM <%metabase_lf_tas_duplicates_202005%> AS m, <%ab_cde_fgh_2_participant%> AS p
WHERE m.id IS NOT NULL AND m.id_participant = p.id

GROUP BY p.p_end::DATE

UNION ALL

SELECT
 COUNT(barcode_participant),
 d.p_end::date
FROM <%metabase_lf_tas_duplicates_202005%> AS m, <%ab_cde_fgh_3_fts%> AS d
WHERE m.id IS NOT NULL AND m.id_results = d.id

GROUP BY d.d_end::DATE
