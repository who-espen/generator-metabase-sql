
SELECT * from (select
  'Male' Sex,
  count(case when p_sex = 'Male' then 1 else null end) as Value
from participant_table_name p
[[ WHERE upper(p.p_euid) = upper({{eu}})]]

union

select
  'Female' Sex,
  count(case when p_sex = 'Female' then 1 else null end) as Value 
from participant_table_name p
[[ WHERE upper(p.p_euid) = upper({{eu}})]]
) part
  order  by part.Sex desc
  
