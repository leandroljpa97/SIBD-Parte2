drop table if exists produced_indicator cascade;
drop table if exists test_procedure cascade;
drop table if exists radiography cascade;
drop table if exists performed cascade;
drop table if exists proced cascade;
drop table if exists indicator cascade;
drop table if exists prescription cascade;
drop table if exists medication cascade;
drop table if exists consult_diagnosis cascade;
drop table if exists diagnosis_code cascade;
drop table if exists participation cascade;
drop table if exists consult cascade;
drop table if exists animal cascade;
drop table if exists generalization_species cascade;
drop table if exists species cascade;
drop table if exists assistant cascade;
drop table if exists veterinary cascade;
drop table if exists client cascade;
drop table if exists phone_number cascade;
drop table if exists person cascade;

create table person(
  VAT numeric(9,0),
  name varchar(255),
  address_street varchar(255),
  address_city varchar(255),
  address_zip varchar(255),
  primary key(VAT)
);

create table phone_number(
  VAT numeric(9,0),
  phone numeric(9,0),
  primary key(VAT, phone),
  foreign key(VAT) references person(VAT)
);

create table client(
  VAT numeric(9,0),
  primary key(VAT),
  foreign key(VAT) references person(VAT)
);

create table veterinary(
  VAT numeric(9,0),
  specialization varchar(255),
  bio varchar(255),
  primary key(VAT),
  foreign key(VAT) references person(VAT)
);

create table assistant(
  VAT numeric(9,0),
  primary key(VAT),
  foreign key(VAT) references person(VAT)
);

create table species(
  name varchar(255),
  description varchar(255),
  primary key(name)
);

create table generalization_species(
  name1 varchar(255),
  name2 varchar(255),
  primary key(name1),
  foreign key(name1) references species(name),
  foreign key(name2) references species(name)
);

create table animal(
  name varchar(255),
  VAT numeric(9,0),
  species_name varchar(255),
  colour varchar(255),
  gender varchar(255),
  birth_year date,
  age integer,
  primary key(name, VAT),
  foreign key(VAT) references client(VAT) on delete cascade,
  foreign key(species_name) references species(name)
);

create table consult(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  s varchar(255),
  o varchar(255),
  a varchar(255),
  p varchar(255),
  VAT_client numeric(9,0),
  VAT_vet numeric(9,0),
  weight numeric(5,2),
  primary key(name, VAT_owner, date_timestamp),
  foreign key(name, VAT_owner) references animal(name, VAT) on delete cascade,
  foreign key(VAT_client) references client(VAT) on delete cascade,
  foreign key(VAT_vet) references veterinary(VAT)
);

create table participation(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  VAT_assistant numeric(9,0),
  primary key(name, VAT_owner, date_timestamp, VAT_assistant),
  foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade,
  foreign key(VAT_assistant) references assistant(VAT)
);

create table diagnosis_code(
  code varchar(255),
  name varchar(255),
  primary key(code)
);

create table consult_diagnosis(
  code varchar(255),
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  primary key(code, name, VAT_owner, date_timestamp),
  foreign key(code) references diagnosis_code(code),
  foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade
);

create table medication(
  name varchar(255),
  lab varchar(255),
  dosage numeric(20, 2),
  primary key(name, lab, dosage)
);

create table prescription(
  code varchar(255),
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  name_med varchar(255),
  lab varchar(255),
  dosage numeric(20, 2),
  regime varchar(255),
  primary key(code, name, VAT_owner, date_timestamp, name_med, lab, dosage),
  foreign key(code, name, VAT_owner, date_timestamp) references consult_diagnosis(code, name, VAT_owner, date_timestamp) on update cascade on delete cascade,
  foreign key(name_med, lab, dosage) references medication(name, lab, dosage)
);

create table indicator(
  name varchar(255),
  reference_value numeric(10, 2),
  units varchar(255),
  description varchar(255),
  primary key(name)
);

create table proced(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  num numeric(20, 0),
  description varchar(255),
  primary key(name, VAT_owner, date_timestamp, num),
  foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade
);

create table performed(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  num numeric(20, 0),
  VAT_assistant numeric(9,0),
  primary key(name, VAT_owner, date_timestamp, num, VAT_assistant),
  foreign key(name, VAT_owner, date_timestamp, num) references proced(name, VAT_owner, date_timestamp, num) on delete cascade,
  foreign key(VAT_assistant) references assistant(VAT) on delete cascade
);

create table radiography(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  num numeric(20, 0),
  file varchar(255),
  primary key(name, VAT_owner, date_timestamp, num),
  foreign key(name, VAT_owner, date_timestamp, num) references proced(name, VAT_owner, date_timestamp, num) on delete cascade
);

create table test_procedure(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  num numeric(20, 0),
  type varchar(255),
  primary key(name, VAT_owner, date_timestamp, num),
  foreign key(name, VAT_owner, date_timestamp, num) references proced(name, VAT_owner, date_timestamp, num) on delete cascade,
  check(type = 'blood' or type = 'urine')
);

create table produced_indicator(
  name varchar(255),
  VAT_owner numeric(9,0),
  date_timestamp timestamp,
  num numeric(20, 0),
  indicator_name varchar(255),
  value numeric(20, 1),
  primary key(name, VAT_owner, date_timestamp, num, indicator_name),
  foreign key(name, VAT_owner, date_timestamp, num) references test_procedure(name, VAT_owner, date_timestamp, num) on delete cascade,
  foreign key(indicator_name) references indicator(name)
);

/*
birth_year pode ser data toda?
gender = male ou female (ou unknown)
test type = blood ou urine
mudar os cabeçalhos das views para darem iguais
