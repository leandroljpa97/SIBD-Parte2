select code, diagnosis_code.name as diagnosis, count(distinct name_med) as counter
from prescription right outer join diagnosis_code using(code)
group by code
order by counter asc;
