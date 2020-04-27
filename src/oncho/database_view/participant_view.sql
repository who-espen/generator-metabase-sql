/*
 * File: participant_view.sql
 * File Created: Thursday, 23rd April 2020 2:11:14 pm
 * Author: Dyesse YUMBA
 * Last Modified: Thursday, 23rd April 2020 3:05:53 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UHC/ESPEN
 */

  /*
 * Variable to rename  <%v_ab_cde_fgh_3_dbs%>, <%ab_cde_fgh_3_dbs d%>
 */

CREATE VIEW <%v_ab_cde_fgh_2_participant%>
AS SELECT p.id,
    p.p_recorder_id,
    p.p_district_id,
    p.p_cluster_id,
      --  c2.cluster_name AS p_cluster_name,
    p.p_consent,
    p.p_age_yrs,
    p.p_how_long_lived,
    p.p_travel,
    p.p_ivm,
    p.p_ivm_where,
    p.p_sex,
    p.p_id_method,
    p.p_barcode_id,
    p.p_generate_id,
    p.p_additional_notes,
    p.p_end_time AS p_date
   FROM <%ab_cde_fgh_2_participant%> p
