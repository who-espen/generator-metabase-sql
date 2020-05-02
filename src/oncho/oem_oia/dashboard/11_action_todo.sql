/*
 * File: 11_action_todo.sql
 * File Created: Saturday, 2nd May 2020 11:45:38 am
 * Author: Dyesse YUMBA
 * Last Modified: Saturday, 2nd May 2020 11:49:11 am
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will provide the list of actions to do for fixing the mistakes on data
 * Variable to rename <%surver_detail%> <%matabase_oncho_oem_action_todo_202004%>
 */
SELECT
 id "SN",
 description "Description",
 actor "Actor",
 status "Status",
 due_date "Due Date"
FROM <%matabase_oncho_oem_action_todo_202004%>
WHERE surver_detail = '<%surver_detail%>'
