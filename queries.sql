--1 meti distinct pq  o mesmo animal pode  ir em datas diferentes ao mm gajo
select distinct animal.name, O.name, species_name, animal.age
from animal natural join consult, person V, person O
where ((V.name ='John Smith')and V.VAT=VAT_vet)
  and O.VAT=consult.VAT_owner;

--2
select name, reference_value
from indicator
where units = 'milligrams' and reference_value > 100
order by reference_value desc;

--3

--4
-- select name,VAT, address_street, address_city, address_zip
select *
from person  natural join client
where VAT not in (select a.VAT from animal a );

--5
select code, count(distinct medication_name) as counter
from prescription
group by code
order by counter asc;

--6

--7
/*
select name2, max(count(*))
from consult_diagnosis , generalization_species
where species_name='dog' and consult_diagnosis.name=generalization_species.name2
group by code
*/

--8
select name
from person
where VAT exists in(
  select VAT from veterinary
  union
  select VAT from assistant
  intersect
  select VAT from client);
--9
