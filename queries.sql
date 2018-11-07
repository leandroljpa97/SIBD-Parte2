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
where weight > 30 and Per.VAT= client.VAT  and (o like '%obesity%' or o like '%obese%')
and date_timestamp in (select max(date_timestamp) from animal as a natural join consult
where a.VAT=An.VAT and a.name=An.name
group by a.VAT, a.name);


--4
select *
from person  natural join client
where VAT not in (select a.VAT from animal a);

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

select name1 as breed, diagnosis_code.name
from generalization_species inner join animal on species_name = name1
natural join consult_diagnosis
inner join diagnosis_code on consult_diagnosis.code = diagnosis_code.code
where name2 = 'dog' and counter >

select name1 as breed, diagnosis_code.name, count(*)
from generalization_species inner join animal on species_name = name1
natural join consult_diagnosis
inner join diagnosis_code on consult_diagnosis.code = diagnosis_code.code
where name2 = 'dog' group by breed, diagnosis_code.name;

--8
select name
from person natural join client
where VAT in(
  select VAT from veterinary
  union
  select VAT from assistant);


--9
select distinct p.name, p.vat, address_zip,address_city,address_street
from person as p
where p.vat in
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

--updates:

--1
update person natural join client
set address_street='Rua da Bela Vista', address_city='Lisboa', address_zip='2695'
where name='John Smith'

--2
update indicator natural join produced_indicator natural join test_procedure
set reference_value= reference_value*1.1
where units = 'milligrams' and type = 'blood';

update  test_procedure natural join produced_indicator inner join indicator  on produced_indicator.indicator_name=indicator.name
set reference_value= reference_value*1.1
where units='milligrams' and type='blood';

--4
update consult_diagnosis
set code = (select code from diagnosis_code where name = 'end-stage renal disease'),
date_timestamp = date_timestamp, name = name,
VAT_owner = VAT_owner
where code = (select code from diagnosis_code where name = 'kidney failure');

update (consult_diagnosis natural join test_procedure natural join produced_indicator)
set code = (select code from diagnosis_code where name = 'end-stage renal disease'),
date_timestamp = date_timestamp,
name = name,
VAT_owner = VAT_owner
where code = (select code from diagnosis_code where name = 'kidney failure')
and type = 'blood'
and indicator_name = 'creatinine level'
and value > 1;
