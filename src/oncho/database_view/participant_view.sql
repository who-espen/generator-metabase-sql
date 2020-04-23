CREATE VIEW public.v_oem_oemparticipantv5_mozambique_pt
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
    p.p_end_time
   FROM oem_oemparticipantv5_mozambique_pt p
     LEFT JOIN clusters c2 ON p.p_cluster_id = c2.cluster_id::text;
