--1
create or replace view dim_date as(
	select distinct date_timestamp,
		DAY(date_timestamp) as day,
		MONTH(date_timestamp) as month,
		YEAR(date_timestamp) as year
	from consult
);

--2
create view dim_animal as(
	select name as animal_name,
		VAT as animal_vat,
		species_name as species,
		age
	from animal
);

--3
create or replace view facts_consults as(
	select dim_animal.animal_name as name,
		dim_animal.animal_vat as vat,
		dim_date.date_timestamp as timestamp,
		count(distinct proced.name, proced.VAT_owner, proced.date_timestamp, proced.num) as num_procedures,
		count(distinct p.name, p.VAT_owner, p.date_timestamp, p.code, p.name_med, p.lab, p.dosage) as num_medication
	from consult inner join dim_animal on consult.name = dim_animal.animal_name and consult.VAT_owner = dim_animal.animal_vat
	natural join dim_date
	natural left outer join proced
	natural left join (prescription as p)
	group by date_timestamp, name, VAT_owner
);
