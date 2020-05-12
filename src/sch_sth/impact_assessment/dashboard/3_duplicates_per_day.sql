/*
 * File: 3_duplicates_per_day.sql
 * File Created: Monday, 11th May 2020 8:26:28 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 12th May 2020 9:40:56 am
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * A query to display the total records of duplicates per day
 * Variable to rename <%metabase_sch_sth_ias_duplicates_202005%>, <%v_ab_cde_fgh_3_kk%>, <%ab_cde_fgh_2_participant%>,
 * <%v_ab_cde_fgh_4_urine%>
 */
 SELECT
 COUNT(barcode_participant),
 p.p_end::date
FROM <%metabase_sch_sth_ias_duplicates_202005%> AS m, <%ab_cde_fgh_2_participant%> AS p
WHERE m.id IS NOT NULL AND m.id_participant = p.id

GROUP BY p.p_end::DATE

UNION ALL

SELECT
 COUNT(barcode_results),
 d.p_end::date
FROM <%metabase_sch_sth_ias_duplicates_202005%> AS m, <%v_ab_cde_fgh_3_kk%> AS d
WHERE m.id IS NOT NULL AND m.id_results_kk = d.id

GROUP BY d.d_end::DATE

UNION ALL

SELECT
 COUNT(barcode_results),
 d.p_end::date
FROM <%metabase_sch_sth_ias_duplicates_202005%> AS m, <%v_ab_cde_fgh_4_urine%> AS d
WHERE m.id IS NOT NULL AND m.id_results_urine = d.id

GROUP BY d.d_end::DATE
