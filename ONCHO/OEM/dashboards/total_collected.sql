SELECT 'Examined by ELISA' "Designation", count(d.id) as "Count" 
    from diagnostic_table_name d
  INNER JOIN participant_table_name p on p.p_barcode_id = d.db_barcode_id
  [[where upper(p_euid) = upper({{eu}})]]
group by "Designation"
  
  UNION

  SELECT 'Participants' "Designation", count(id) as "Count" from public.oem_oemparticipant_ghana
  [[where upper(p_euid) = upper({{eu}})]]
group by "Designation"

