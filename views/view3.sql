create or replace view facts_concults as(
 select dim_animal.animal_name as name,
 dim_animal.animal_vat as vat,
 dim_date.date_timestamp as timestamp,
 count(distinct proced.name, proced.VAT_owner, proced.date_timestamp, proced.num)
 as num_procedures,
 count(distinct p.name, p.VAT_owner, p.date_timestamp, p.code, p.name_med, p.lab, p.dosage)
 as num_medication
 from consult inner join dim_animal
 on consult.name = dim_animal.animal_name and consult.VAT_owner = dim_animal.animal_vat
 natural join dim_date
 natural left outer join proced
 natural left join (prescription as p)
 group by dim_date.date_timestamp, name, VAT_owner
);
