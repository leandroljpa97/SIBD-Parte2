--1 meti distinct pq  o mesmo animal pode  ir em datas diferentes ao mm gajo
select distinct animal.name, O.name as owner_name, species_name, animal.age
from animal natural join consult, person V, person O
where ((V.name ='John Smith')and V.VAT=VAT_vet)
  and O.VAT=consult.VAT_owner;

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
where weight > 30 and (o like '%obesity%' or o like '%obese%')
and date_timestamp in (
  select max(date_timestamp) from animal as a natural join consult
  where a.VAT=animal.VAT and a.name=animal.name
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
  count(distinct consult_diagnosis.code)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_diagnostic_codes,
  count(distinct prescription.name, prescription.VAT_owner, prescription.date_timestamp, prescription.code, prescription.name_med, prescription.lab, prescription.dosage)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_prescriptions
from (consult as con) natural left outer join (participation as par) natural left outer join prescription natural left outer join consult_diagnosis natural left outer join proced
where YEAR(date_timestamp) = 2017;

--7
select name1 as species, diagnosis_code.name as diagnosis
from (generalization_species as g) inner join animal on species_name = name1
natural join consult_diagnosis
inner join diagnosis_code on consult_diagnosis.code = diagnosis_code.code
where name2 = 'dog' group by name1, diagnosis_code.name
having count(*) >= all(
  select count(*)
  from animal as a natural join consult_diagnosis as cd
  inner join (diagnosis_code as dc) on cd.code = dc.code
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
from person as p inner join animal on p.VAT=animal.VAT
where p.vat not in(
  select VAT
  from animal
  where species_name not like '%bird%');
