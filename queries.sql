--1 meti distinct pq  o mesmo animal pode  ir em datas diferentes ao mm gajo
select distinct animal.name, O.name, species_name, animal.age
from animal natural join consult, person V, person O
where ((V.name ='John Smith')and V.VAT=VAT_vet)
  and O.VAT=consult.VAT_owner;


-- NAO CONSEGUI PERCEBER MT BEM SE ISTO OPTIMIZOU ALGO OU NAÃO...
create index idx_person_name on person(name);
create index idx_consult_Vat_vet on consult(VAT_vet);

--2
select name, reference_value
from indicator
where units = 'milligrams' and reference_value > 100
order by reference_value desc;

--index
create index idx_indicator_units_reference_value on indicator(units, reference_value);


--3

select Per.name, An.name, species_name, age
from  client natural join animal An natural join consult, person Per
where weight > 30 and Per.VAT= client.VAT and (
  o like '%obesity%' or o like '%obese%');


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

 select count(*)
from consult natural join consult_diagnosis where date_timestamp>'2017-1-1' ;
group by consult;


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



select distinct p.name, p.vat, address_zip,address_city,address_street
from person as p
where exists
(select a.VAT
from animal as a
where a.species_name like '%bird%' and a.VAT not in
(select a2.VAT 
from animal as a2
where a2.species_name not like '%bird%'));




-- views:

-- view 1
create view dim_date as
	(select distinct date_timestamp, DAY(date_timestamp) as day, MONTH(date_timestamp) as month, YEAR(date_timestamp) as year
	 from consult);
-- checkar a view nº 1
select date_timestamp, day, month, year
from dim_date;


-- view 2
create view dim_animal as
(select name as animal_name, VAT as animal_vat, species_name as species, age
 from animal);
-- checkar a view nº 2
select animal_name, animal_vat, species, age
from dim_animal;
