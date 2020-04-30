/*
 * File: rdt_ov19_view.sql
 * File Created: Thursday, 23rd April 2020 3:09:40 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 28th April 2020 3:37:31 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * Variable to rename <%ab_cde_fgh_3_rdt_ov16%>
 */

CREATE VIEW <%v_ab_cde_fgh_3_rdt_ov16%>
AS SELECT p.id,
    p.d_Recorder_ID,
    p.d_district,
    p.d_Cluster_ID,
    p.d_LabOV162ndTest,
    p.d_lotnumber,
    p.d_IDType,    ,
    CASE WHEN d_IDType = 'Scanner' THEN p.d_Barcode_ID ELSE d_Generate_ID END as d_Barcode_ID,
    -- p.d_Barcode_ID,
    -- p.d_Generate_ID,
    -- p.d_Generate_ID2,
    p.d_LabOV16,
    p.d_LabOV16Invalid,
    p.d_Notes,
    p.d_End_Time AS d_date
   FROM <%ab_cde_fgh_3_rdt_ov16%> p
