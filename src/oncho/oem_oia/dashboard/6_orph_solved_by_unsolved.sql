/*
 * File: 6_orph_solved_by_unsolved.sql
 * File Created: Thursday, 30th April 2020 2:37:31 pm
 * Author: Dyesse YUMBA
 * Last Modified: Thursday, 30th April 2020 2:40:52 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * A query to get number of orphaned errors solved by the number of orphaned records unsolved
 * Variable to rename <%matabase_oncho_oem_orphaned_202004%>
 */
SELECT
    'Solved' status,
	count(CASE WHEN status = 'Solved' THEN 1 ELSE NULL END) total,


FROM <%matabase_oncho_oem_orphaned_202004%>

UNION

SELECT
    'Unsolved' status,
	count(CASE WHEN status = 'Solved' THEN 1 ELSE NULL END) total

FROM <%matabase_oncho_oem_orphaned_202004%>
