/*
 * Variable to rename <%v_bf_lf_bsa_2_village%>, <%bf_lf_bsa_2_village%>
 */
CREATE view <%v_bf_lf_bsa_2_village%>
 AS
SELECT

id,
v_recorder_id,
v_district,
v_basin,
v_village,
v_gps_lat,
v_gps_lng,
v_gps_alt,
v_gps_acc,
v_total_population,
v_notes,
v_end v_date

FROM <%bf_lf_bsa_2_village%>
