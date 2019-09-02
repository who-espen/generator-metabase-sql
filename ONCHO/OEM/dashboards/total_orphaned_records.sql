 SELECT 'Participant missing results' AS orphaned_records,
    count(p.id) AS count
   FROM participant_table_name p
     LEFT JOIN diagnostic_table_name r ON p.p_barcode_id = r.d_barcode_id
  WHERE r.d_barcode_id IS NULL
UNION
 SELECT 'Results missing participant' AS orphaned_records,
    count(r.id) AS count
   FROM participant_table_name p
     RIGHT JOIN diagnostic_table_name r ON p.p_barcode_id = r.d_barcode_id
  WHERE p.p_barcode_id IS NULL;