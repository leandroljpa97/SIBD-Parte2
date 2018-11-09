select animal.name, person.name as owner_name, species_name, age
from client
natural join animal
inner join consult on animal.VAT = consult.VAT_owner and animal.name = consult.name
inner join person using(VAT)
where (o like '%obesity%' or o like '%obese%') and weight > 30
and date_timestamp in(
  select max(date_timestamp) from animal as a natural join consult
  where a.name=animal.name and a.VAT=animal.VAT
  group by a.VAT, a.name);
