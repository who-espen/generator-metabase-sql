select 
 id,
 p_recorder_id ,
 p_district_id,
 p_euid,
 p_cluster_id,
 p_consent,
 p_how_long_lived,
 p_sex,
 p_age_yrs,
 p_travel,
 p_ivm,
 p_ivm_where,
 p_id_method,
 p_barcode_id,
 p_additional_notes,
 created_at
from participant_table_name
[[where p_euid = upper({{eu}})]]