/*
 * File: rdt_ov19_view.sql
 * File Created: Thursday, 23rd April 2020 3:09:40 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 27th April 2020 2:54:24 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UHC/ESPEN
 */

/*
 * Variable to rename <%v_ab_cde_fgh_3_participant%>, <%ab_cde_fgh_3_rdt_ov16%>
 */

CREATE VIEW <%v_ab_cde_fgh_3_participant%>
AS SELECT p.id,
    p.d_Recorder_ID,
    p.d_district_id,
    p.d_Cluster_ID,
    p.d_LabOV162ndTest,
    p.d_lotnumber,
    p.d_IDType,
    p.d_Barcode_ID,
    p.d_Generate_ID,
    p.d_Generate_ID2,
    p.d_LabOV16,
    p.d_LabOV16Invalid,
    p.d_Notes,
    p.d_End_Time AS d_date
   FROM <%ab_cde_fgh_3_rdt_ov16%> p
