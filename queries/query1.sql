select distinct animal.name, O.name as owner_name, species_name, animal.age
from animal
inner join consult on animal.VAT = consult.VAT_owner and animal.name = consult.name
inner join person V on V.VAT = VAT_vet
inner join person O on O.VAT = consult.VAT_owner
where V.name = 'John Smith';
