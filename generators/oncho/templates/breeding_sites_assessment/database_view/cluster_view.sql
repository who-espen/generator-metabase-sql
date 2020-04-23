/*
 * File: cluster_view.sql
 * File Created: Wednesday, 22nd April 2020 2:51:35 pm
 * Author: Dyesse YUMBA
 * Last Modified: Wednesday, 22nd April 2020 6:09:49 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UHC/ESPEN
 */

CREATE VIEW v_oem_oemclusterv5_2_mozambique_pt
AS
SELECT c.id,
    c.c_recorder_id,
    c.c_eu
    c.c_district,
    c.c_cluster_name,
    c.c_cluster_id1
    c.c_cluster_id2,
    c.c_gps_lat,
    c.c_gps_lng,
    c.c_gps_alt,
    c.c_gps_acc,
    c.c_village_pop,
    c.c_black_fly,
    c.c_cluster_notes,
    c.c_end_time AS c_date
FROM oem_oemclusterv5_2_mozambique_pt c;
