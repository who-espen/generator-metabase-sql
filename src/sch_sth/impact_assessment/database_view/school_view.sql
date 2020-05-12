/*
 * File: school_view.sql
 * File Created: Monday, 11th May 2020 12:39:08 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 11th May 2020 12:41:13 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * Variable to rename  <%ab_cde_fgh_1_school%>, <%v_ab_cde_fgh_1_school%>
 */
 CREATE <%v_ab_cde_fgh_1_school%>
AS
SELECT
 id,
 w_recorder_id,
 w_region,
 w_district,
 w_subdistrict,
 w_school_id,
 w_school_name,
 w_gps_lat,
 w_gps_lng,
 w_gps_acc,
 w_deworming,
 w_source_exist,
 w_source_drinkable,
 w_source_type,
 w_accessible_water,
 w_toilet,
 CASE WHEN w_toilet_type = 'Other' THEN w_toilet_type_other ELSE w_toilet_type END AS w_toilet_type,
 w_toilet_has_paper,
 w_toilet_has_washing_water,
 w_toilet_has_soap,
 w_obs_toilet_condition,
 w_obs_toilet_has_water,
 w_obs_has_hand_provision,
 w_obs_washing_hand_type,
 w_remarks,
 w_end w_date
FROM <%ab_cde_fgh_1_school%> s
