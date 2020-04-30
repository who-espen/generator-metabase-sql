/*
 * File: 4_dups_solved_per_unsolved.sql
 * File Created: Thursday, 30th April 2020 2:30:57 pm
 * Author: Dyesse YUMBA
 * Last Modified: Thursday, 30th April 2020 2:41:30 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * A query to get the the number/percentages of duplicates fix by the number/percentages of duplicates unfixed
 * Variable to rename <%matabase_oncho_oem_duplicates_202004%>
 */
SELECT
    'Solved' status,
	count(CASE WHEN status = 'Solved' THEN 1 ELSE NULL END) total,


FROM <%matabase_oncho_oem_duplicates_202004%>

UNION

SELECT
    'Unsolved' status,
	count(CASE WHEN status = 'Solved' THEN 1 ELSE NULL END) total

FROM <%matabase_oncho_oem_duplicates_202004%>
