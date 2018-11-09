create or replace view dim_animal as(
 select name as animal_name,
 VAT as animal_vat,
 species_name as species,
 age
 from animal
);
