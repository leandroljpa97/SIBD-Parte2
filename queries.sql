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
select person.name, animal.name, species_name, age
from client natural join animal natural join consult inner join person on client.VAT = person.VAT
where weight > 30 and (o like '%obesity%' or o like '%obese%')
and date_timestamp in (
  select max(date_timestamp) from animal as a natural join consult
  where a.VAT=animal.VAT and a.name=animal.name
  group by a.VAT, a.name);


--4
select *
from person  natural join client
where VAT not in (select a.VAT from animal a);

--5
select code, diagnosis_code.name as medication_name, count(distinct name_med) as counter
from prescription right outer join diagnosis_code using(code)
group by code
order by counter asc;

--6
select
count(distinct participation.name, participation.VAT_owner, participation.date_timestamp, participation.VAT_assistant)/count(distinct consult.name, consult.VAT_owner, consult.date_timestamp) as average_assistants,
count(distinct proced.name, proced.VAT_owner, proced.date_timestamp, proced.num)/count(distinct consult.name, consult.VAT_owner, consult.date_timestamp) as average_procedures,
count(distinct consult_diagnosis.code)/count(distinct consult.name, consult.VAT_owner, consult.date_timestamp) as average_diagnostic_codes,
count(distinct prescription.name, prescription.VAT_owner, prescription.date_timestamp, prescription.code, prescription.name_med, prescription.lab, prescription.dosage)/count(distinct consult.name, consult.VAT_owner, consult.date_timestamp) as average_prescriptions
from consult natural left outer join participation natural left outer join prescription natural left outer join consult_diagnosis natural left outer join proced
where YEAR(date_timestamp) = 2017;

--7
select name1, diagnosis_code.name
from (generalization_species as g1) inner join animal on species_name = name1
natural join consult_diagnosis
inner join diagnosis_code on consult_diagnosis.code = diagnosis_code.code
where name2 = 'dog' group by name1, diagnosis_code.name
having count(*) >= all(
  select count(*)
  from animal natural join consult_diagnosis
  inner join (diagnosis_code as d2) on consult_diagnosis.code = d2.code
  where animal.species_name=g1.name1 group by d2.name);

--8
select name
from person natural join client
where VAT in(
  select VAT from veterinary
  union
  select VAT from assistant);

--9
select distinct p.name, p.vat, address_zip, address_city, address_street
from person as p inner join animal on p.VAT=animal.VAT
where p.vat not in (select a2.VAT
from animal as a2
where a2.species_name not like '%bird%');

-- views:

-- view 1
create or replace view dim_date as
	(select distinct date_timestamp, DAY(date_timestamp) as day, MONTH(date_timestamp) as month, YEAR(date_timestamp) as year
	 from consult);

-- checkar a view nº 1
select date_timestamp, day, month, year
from dim_date;

/*
na próxima, n metemos distinct porque eles já são PK
 */

-- view 2
create view dim_animal as
  (select name as animal_name, VAT as animal_vat, species_name as species, age
   from animal);
-- checkar a view nº 2
select animal_name, animal_vat, species, age
from dim_animal;

--view 3
  create or replace view facts_consults as
    (select dim_animal.animal_name as name, dim_animal.animal_vat as vat,
    dim_date.date_timestamp as timestamp,
    count(distinct proced.name, proced.VAT_owner, proced.date_timestamp, proced.num) as num_procedures,
    count(distinct prescription.name, prescription.VAT_owner, prescription.date_timestamp, prescription.code, prescription.name_med, prescription.lab, prescription.dosage) as num_medication
    from consult inner join dim_animal on consult.name = dim_animal.animal_name and consult.VAT_owner = dim_animal.animal_vat
    natural join dim_date
    natural left outer join proced
    natural left join prescription group by date_timestamp, name, VAT_owner);


-- checkar a view nº 3
select name, vat, timestamp, num_procedures, num_medication
from facts_consults;

--updates:

--1
update person natural join client
set address_street='Rua da Bela Vista', address_city='Lisboa', address_zip='2695'
where name='John Smith'

--2
update  test_procedure natural join produced_indicator inner join indicator  on produced_indicator.indicator_name=indicator.name
set reference_value= reference_value*1.1
where units='milligrams' and type='blood';

--3
delete from client where VAT in(select VAT from person where name = 'John Smith' );

--4
update (consult_diagnosis natural join test_procedure natural join produced_indicator)
set code = (select code from diagnosis_code where name = 'end-stage renal disease'),
date_timestamp = date_timestamp,
name = name,
VAT_owner = VAT_owner
where code = (select code from diagnosis_code where name = 'kidney failure')
and type = 'blood'
and indicator_name = 'creatinine level'
and value > 1;
