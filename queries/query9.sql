select distinct p.name, address_zip, address_city, address_street
from person as p inner join animal using(VAT)
where p.vat not in(
  select VAT
  from animal
  where species_name not like '%bird%');
