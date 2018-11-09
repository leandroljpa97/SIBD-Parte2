--1
select distinct animal.name, O.name as owner_name, species_name, animal.age
from animal
inner join consult on animal.VAT = consult.VAT_owner and animal.name = consult.name
inner join person V on V.VAT = VAT_vet
inner join person O on O.VAT = consult.VAT_owner
where V.name = 'John Smith';

--2
select name, reference_value
from indicator
where units = 'milligrams' and reference_value > 100
order by reference_value desc;

--3
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

--4
select name, VAT, address_street, address_city, address_zip
from person natural join client
where VAT not in (select a.VAT from animal a);

--5
select code, diagnosis_code.name as diagnosis, count(distinct name_med) as counter
from prescription right outer join diagnosis_code using(code)
group by code
order by counter asc;

--6
select
  count(distinct par.name, par.VAT_owner, par.date_timestamp, par.VAT_assistant)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_assistants,
  count(distinct proced.name, proced.VAT_owner, proced.date_timestamp, proced.num)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_procedures,
  count(distinct cd.code, cd.name, cd.VAT_owner, cd.date_timestamp)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_diagnostic_codes,
  count(distinct p.name, p.VAT_owner, p.date_timestamp, p.code, p.name_med, p.lab, p.dosage)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_prescriptions
from (consult as con)
natural left outer join (participation as par)
natural left outer join (consult_diagnosis as cd)
natural left outer join (prescription as p)
natural left outer join proced
where YEAR(date_timestamp) = 2017;

--7
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


--8
select name
from person natural join client
where VAT in(
  select VAT from veterinary
  union
  select VAT from assistant);

--9
select distinct p.name, address_zip, address_city, address_street
from person as p inner join animal using(VAT)
where p.vat not in(
  select VAT
  from animal
  where species_name not like '%bird%');
