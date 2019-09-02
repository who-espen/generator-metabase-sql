select result, sum(count) as Count  from (

SELECT 
  -- TODO: update the positivity condition
CASE WHEN (db_positivity = 1) THEN 'ELISA Positive' ELSE 'ELISA Negative' END as result,
count(db_positivity) as count,
  p_euid
  
  FROM diagnostic_table_name db
  INNER JOIN participant_table_name p on p.p_barcode_id = db.db_barcode_id

  group by db_positivity, p_euid) s
  
  [[where upper(s.p_euid) = upper({{p_euid}})]]
  
  group by result
