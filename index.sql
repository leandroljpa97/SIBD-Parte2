--1
create index idx_person_name on person(name);

--2
create index idx_indicator_units_reference_value on indicator(units, reference_value);
