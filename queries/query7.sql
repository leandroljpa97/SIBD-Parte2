select name1 as species, diagnosis_code.name as diagnosis
from (generalization_species as g)
inner join animal on species_name = name1
inner join consult_diagnosis on consult_diagnosis.name = animal.name and consult_diagnosis.VAT_owner = animal.VAT
inner join diagnosis_code using(code)
where name2 = 'dog' group by name1, diagnosis_code.name
having count(*) >= all(
  select count(*)
  from animal as a
  inner join (consult_diagnosis as cd) on cd.name = a.name and cd.VAT_owner = a.VAT
  inner join (diagnosis_code as dc) using(code)
  where a.species_name=g.name1 group by dc.name);
