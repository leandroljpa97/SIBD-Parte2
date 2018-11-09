drop table if exists produced_indicator;
drop table if exists test_procedure;
drop table if exists radiography;
drop table if exists performed;
drop table if exists proced;
drop table if exists indicator;
drop table if exists prescription;
drop table if exists medication;
drop table if exists consult_diagnosis;
drop table if exists diagnosis_code;
drop table if exists participation;
drop table if exists consult;
drop table if exists animal;
drop table if exists generalization_species;
drop table if exists species;
drop table if exists assistant;
drop table if exists veterinary;
drop table if exists client;
drop table if exists phone_number;
drop table if exists person;

create table person(
  VAT varchar(20),
  name varchar(255) not null,
  address_street varchar(255) not null,
  address_city varchar(255) not null,
  address_zip varchar(255) not null,
  primary key(VAT)
);

create table phone_number(
  VAT varchar(20),
  phone numeric(9,0) not null, 
  primary key(VAT, phone),
  foreign key(VAT) references person(VAT)
);

create table client(
  VAT varchar(20),
  primary key(VAT),
  foreign key(VAT) references person(VAT)
);

create table veterinary(
  VAT varchar(20),
  specialization varchar(255) not null, -- is required additional inormation
  bio varchar(255) not null,
  primary key(VAT),
  foreign key(VAT) references person(VAT)
);

create table assistant(
  VAT varchar(20),
  primary key(VAT),
  foreign key(VAT) references person(VAT)
);

create table species(
  name varchar(255),
  description varchar(255) not null,
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
  VAT varchar(20),
  species_name varchar(255),
  colour varchar(255) not null,
  gender varchar(255) not null,
  birth_year date not null,
  age integer not null,
  primary key(name, VAT),
  foreign key(VAT) references client(VAT) on delete cascade,
  foreign key(species_name) references species(name),
  check(birth_year <= current_date),
  check(age = timestampdiff(YEAR, birth_year, NOW())),
  check(gender='male' or gender='female' or gender='other')
);



create table consult(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp not null,
  s varchar(255),
  o varchar(255),
  a varchar(255),
  p varchar(255),
  VAT_client varchar(20),
  VAT_vet varchar(20),
  weight numeric(5,2) not null,
  primary key(name, VAT_owner, date_timestamp),
  foreign key(name, VAT_owner) references animal(name, VAT) on delete cascade,
  foreign key(VAT_client) references client(VAT) on delete cascade,
  foreign key(VAT_vet) references veterinary(VAT),
  check(weight>0),
  check(date_timestamp <= current_date)
);

create table participation(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  VAT_assistant varchar(20),
  primary key(name, VAT_owner, date_timestamp, VAT_assistant),
  foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade,
  foreign key(VAT_assistant) references assistant(VAT)
);

create table diagnosis_code(
  code varchar(255),
  name varchar(255) not null,
  primary key(code)
);

create table consult_diagnosis(
  code varchar(255),
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  primary key(code, name, VAT_owner, date_timestamp),
  foreign key(code) references diagnosis_code(code),
  foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade
);

create table medication(
  name varchar(255),
  lab varchar(255),
  dosage numeric(20, 2),
  primary key(name, lab, dosage),
  check(dosage>=0)
);

create table prescription(
  code varchar(255),
  name varchar(255),
  VAT_owner varchar(20),
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
  reference_value numeric(10, 2) not null,
  units varchar(255) not null,
  description varchar(255) not null,
  primary key(name)
  );

create table proced(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  num numeric(20, 0),
  description varchar(255) not null,
  primary key(name, VAT_owner, date_timestamp, num),
  foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade
);

create table performed(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  num numeric(20, 0),
  VAT_assistant varchar(20),
  primary key(name, VAT_owner, date_timestamp, num, VAT_assistant),
  foreign key(name, VAT_owner, date_timestamp, num) references proced(name, VAT_owner, date_timestamp, num) on delete cascade,
  foreign key(VAT_assistant) references assistant(VAT) on delete cascade
);

create table radiography(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  num numeric(20, 0),
  file varchar(255) not null,
  primary key(name, VAT_owner, date_timestamp, num),
  foreign key(name, VAT_owner, date_timestamp, num) references proced(name, VAT_owner, date_timestamp, num) on delete cascade
);

create table test_procedure(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  num numeric(20, 0),
  type varchar(255) not null,
  primary key(name, VAT_owner, date_timestamp, num),
  foreign key(name, VAT_owner, date_timestamp, num) references proced(name, VAT_owner, date_timestamp, num) on delete cascade,
  check(type = 'blood' or type = 'urine')
);

create table produced_indicator(
  name varchar(255),
  VAT_owner varchar(20),
  date_timestamp timestamp,
  num numeric(20, 0),
  indicator_name varchar(255),
  value numeric(20, 1) not null,
  primary key(name, VAT_owner, date_timestamp, num, indicator_name),
  foreign key(name, VAT_owner, date_timestamp, num) references test_procedure(name, VAT_owner, date_timestamp, num) on delete cascade,
  foreign key(indicator_name) references indicator(name)
);

/*
birth_year pode ser data toda?
gender = male ou female (ou unknown)
test type = blood ou urine
mudar os cabeçalhos das views para darem iguais
