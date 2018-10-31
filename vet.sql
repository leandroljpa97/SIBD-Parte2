drop table if exists produced_indicator cascade;
drop table if exists test_procedure cascade;
drop table if exists radiography cascade;
drop table if exists performed cascade;
drop table if exists procedures cascade;
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

create table person
   (VAT  varchar(255),
    name  varchar(255),
    address_street  varchar(255),
    address_city  varchar(255),
    address_zip  varchar(255),
    primary key(VAT));

create table phone_number
   (VAT  varchar(255),
    phone  numeric(9, 0),
    primary key(VAT, phone),
    foreign key(VAT) references person(VAT));

create table client
   (VAT varchar(255),
    primary key(VAT),
    foreign key(VAT) references person(VAT));

create table veterinary
	( VAT varchar(255),
	  specialization varchar(255),
	  bio varchar(255),
	  primary key(VAT),
	  foreign key(VAT) references person(VAT));

create table assistant
   (VAT varchar(255),
    primary key(VAT),
    foreign key(VAT) references person(VAT));

create table species
	( name varchar(255),
	  description varchar(255),
	  primary key(name));

create table generalization_species
	  (name1 varchar(255),
		 name2 varchar(255),
		 primary key(name1),
		 foreign key(name1) references species(name),
		 foreign key(name2) references species(name));

create table animal(
	name varchar(255),
	VAT varchar(255),
	species_name varchar(255),
	colour varchar(255),
	gender varchar(255),
	birth_year date,
	age integer,
	primary key(name, VAT),
	foreign key(VAT) references client(VAT),
	foreign key(species_name) references species(name));

create table consult(
  date_timestamp  timestamp,
  name varchar(255),
	VAT_owner varchar(255),
	s varchar(255),
	o varchar(255),
	a varchar(255),
	p varchar(255),
	VAT_client varchar(255),
	VAT_vet varchar(255),
	weight numeric(5,2),
	primary key(date_timestamp, name, VAT_owner),
	foreign key(name,VAT_owner) references animal(name,VAT),
	foreign key(VAT_client) references client(VAT),
	foreign key(VAT_vet) references veterinary(VAT),
	check(weight>=0));

create table participation(
  date_timestamp  timestamp,
	name varchar(255),
	VAT_owner varchar(255),
	VAT_assistant varchar(255),
	primary key(date_timestamp, name, VAT_owner, VAT_assistant),
  foreign key(date_timestamp,name,VAT_owner) references consult(date_timestamp,name,VAT_owner),
	foreign key(VAT_assistant) references assistant(VAT));

create table diagnosis_code
   (code  varchar(255),
    name  varchar(255),
    primary key(code));

create table consult_diagnosis
   (code  varchar(255),
    date_timestamp  timestamp,
    name  varchar(255),
    VAT_owner  varchar(255),
    primary key(code, date_timestamp, name, VAT_owner),
    foreign key(code) references diagnosis_code(code),
      foreign key(date_timestamp,name,VAT_owner) references consult(date_timestamp,name,VAT_owner));
  

create table medication
   (name  varchar(255),
    lab  varchar(255),
    dosage  numeric(20, 2),
    primary key(name, lab, dosage));

create table prescription
   (code  varchar(255),
    date_timestamp  timestamp,
    animal_name  varchar(255),
    VAT_owner  varchar(255),
    medication_name varchar(255),
    lab  varchar(255),
    dosage  numeric(20, 2),
    regime  varchar(255),
    primary key(code, date_timestamp, animal_name, VAT_owner, medication_name, lab, dosage),
    foreign key(code,date_timestamp,animal_name,VAT_owner) references consult_diagnosis(code,date_timestamp,name,VAT_owner),
    foreign key(medication_name, lab, dosage) references medication(name, lab, dosage)
);

create table indicator
   (name  varchar(255),
    reference_value  numeric(10, 0),
    units  varchar(255),
    description  varchar(255),
    primary key(name));

create table procedures
   (num  numeric(20, 0),
    date_timestamp  timestamp,
    name  varchar(255),
    VAT_owner  varchar(255),
    description  varchar(255),
    primary key(num, date_timestamp, name, VAT_owner),
      foreign key(date_timestamp,name,VAT_owner) references consult(date_timestamp,name,VAT_owner));

create table performed
   (num  numeric(20, 0),
    date_timestamp  timestamp,
    name  varchar(255),
    VAT_owner  varchar(255),
    VAT_assistant  varchar(255),
    primary key(num, date_timestamp, name, VAT_owner, VAT_assistant),
    foreign key(num,date_timestamp,name,VAT_owner) references procedures(num,date_timestamp,name,VAT_owner),
    foreign key(VAT_assistant) references assistant(VAT));

create table radiography
   (name  varchar(255),
    VAT_owner  varchar(255),
    date_timestamp  timestamp,
    num  numeric(20, 0),
    file  varchar(255),
    primary key(date_timestamp, name, VAT_owner, num),
       foreign key(num,date_timestamp,name,VAT_owner) references procedures(num,date_timestamp,name,VAT_owner));

create table test_procedure
   (name  varchar(255),
    VAT_owner  varchar(255),
    date_timestamp  timestamp,
    num  numeric(20, 0),
    type  varchar(255),
    primary key(name, VAT_owner, date_timestamp, num),
       foreign key(num,date_timestamp,name,VAT_owner) references procedures(num,date_timestamp,name,VAT_owner));

create table produced_indicator
   (name  varchar(255),
    VAT_owner  varchar(255),
    date_timestamp  timestamp,
    num  numeric(20, 0),
    indicator_name varchar(255),
    value  numeric(20, 0),
    primary key(name, VAT_owner, date_timestamp, num, indicator_name),
    foreign key(name,VAT_owner,date_timestamp,num) references test_procedure(name,VAT_owner,date_timestamp,num),
    foreign key(indicator_name) references indicator(name));


insert into person values ('000000000', 'John Smith', 'Main Street', 'New York', '1070-373');
insert into person values ('000000001', 'John Smith', 'Second Street', 'Brooklyn', '1070-000');
insert into person values ('000000002', 'John Doe', 'Main Street', 'Cleveland', '1000-373');
insert into person values ('000000003', 'Bob Dylan', 'Big Avenue', 'Brooklyn', '1050-373');
insert into person values ('000000004', 'Chandler Bing', 'Big Avenue', 'Brooklyn', '1050-373');


insert into client values ('000000000');
insert into client values ('000000002');
insert into client values ('000000003');

insert into veterinary values ('000000001', 'doctor', 'just grew up to be a doctor');
insert into veterinary values ('000000004', 'vet', 'just grew up to be a vet');

insert into species values ('dog', 'human''s best friend');
insert into species values ('cat', 'kinda grumpy. but if it fits, it sits!');

insert into animal values ('doge', '000000000', 'dog', 'yellow', 'male', '1997-12-20', 20);
insert into animal values ('fluffy', '000000002', 'cat', 'black', 'female', '1997-12-27', 20);
insert into animal values ('alilas', '000000002', 'cat', 'brown', 'male', '1997-03-29', 20);

insert into consult(name, VAT_owner, date_timestamp, s, o, a, p, VAT_client, VAT_vet, weight) values
('doge', '000000000', '2005-7-27 09:00:30.75', 's', 'o', 'a', 'p', '000000003', '000000001', 20),
('alilas', '000000002', '2005-7-28 09:00:30.75', 's', 'o', 'a', 'p', '000000000', '000000001', 20),
('alilas', '000000002', '2005-7-29 09:00:30.75', 's', 'o', 'a', 'p', '000000002', '000000001', 20),
('alilas', '000000002', '2005-7-30 09:00:30.75', 's', 'o', 'a', 'p', '000000002', '000000004', 20);

/* vat é numeric?
phone 9 digitos?
como meter age?
birth_year pode ser data toda?
IC
tamanhos dos numeric
gender = male ou female (ou unknown)
test type = blood ou urin
assumirmos que nomes são no formato John Smith
tive de tirar timestamp porque n dava como foreign key. temos de ver!
*/
