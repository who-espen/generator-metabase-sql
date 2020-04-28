/*
 * File: 1_duplicate_per_recorder.sql
 * File Created: Tuesday, 28th April 2020 3:02:05 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 28th April 2020 3:13:07 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UHC/ESPEN
 */


/*
 * A query to display the number of duplicates per recorder
 * Variable to rename <%v_ab_cde_fgh_3_participant%>
 */
SELECT

  "Recorders",
   sum("# Dulicates") "# Dulicates"

FROM (
      SELECT
      	count(m.id) "# Dulicates",
      	p.p_recorder_id "Recorders"
      FROM public.matabase_oncho_oem_duplicates_202004 m, <%v_ab_cde_fgh_3_participant%> p
        WHERE m.id_participant = p.id AND barcode_participant IS NOT NULL
        GROUP BY p.p_recorder_id

      UNION

      SELECT
      	count(m.id) "# Dulicates",
      	d.d_recorder_id "Recorders"
      FROM public.matabase_oncho_oem_duplicates_202004 m, <%v_ab_cde_fgh_3_participant%> d
        WHERE m.id_results = p.id AND barcode_results IS NOT NULL
        GROUP BY d.d_recorder_id
) src

GROUP BY "Recorders"

ORDER BY "# Dulicates" DESC

