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

insert into person values (000000000, 'John Smith', 'Main Street', 'New York', '1000-193');
insert into person values (000000001, 'John Smith', 'Second Street', 'Brooklyn', '1001-439');
insert into person values (000000002, 'John Doe', 'Main Street', 'Cleveland', '1010-798');
insert into person values (000000003, 'Oliver Watts', 'Big Avenue', 'Los Angeles', '1050-375');
insert into person values (000000004, 'Chandler Webbs', 'Small Avenue', 'Brooklyn', '1001-373');
insert into person values (000000005, 'John Smith', 'Main Street', 'New York', '1000-278');
insert into person values (000000006, 'William Lawrence', 'Second Street', 'Brooklyn', '1001-438');
insert into person values (000000007, 'Kelly Jenkins', 'Main Street', 'Cleveland', '1010-348');
insert into person values (000000008, 'Jacob Chambers', 'Second Street', 'Brooklyn', '1001-230');
insert into person values (000000009, 'Harry Spencer', 'Big Avenue', 'Brooklyn', '1001-436');
insert into person values (000000010, 'Jack Lawson', 'Third Street', 'California', '1070-089');
insert into person values (000000011, 'Rhys Woods', 'Main Street', 'Dallas', '1100-324');
insert into person values (000000012, 'Thomas Ress', 'Big Avenue', 'Chicago', '1078-375');
insert into person values (000000013, 'George Fraser', 'Small Street', 'Brooklyn', '1001-850');
insert into person values (000000014, 'Damian Black', 'Big Avenue', 'Dallas', '1100-279');
insert into person values (000000015, 'Joe Fletcher', 'Third Street', 'Houston', '1073-384');
insert into person values (000000016, 'Jones', 'Small Avenue', 'Brooklyn', '1001-379');
insert into person values (000000017, 'Noah Taylor', 'Small Avenue', 'Forth Worth', '1356-167');
insert into person values (000000018, 'Ethan Brown', 'Main Street', 'Dallas', '1100-300');
insert into person values (000000019, 'Ethan Brown', 'Second Street', 'San Diego', '1263-368');
insert into person values (000000020, 'Joseph Davis', 'Third Street', 'Fort Worth', '1356-738');

insert into phone_number values(000000000, 934368287);
insert into phone_number values(000000003, 963154632);
insert into phone_number values(000000003, 926842214);
insert into phone_number values(000000003, 913546541);
insert into phone_number values(000000005, 933987048);
insert into phone_number values(000000006, 966984516);
insert into phone_number values(000000007, 925424700);
insert into phone_number values(000000008, 917813568);
insert into phone_number values(000000009, 933534684);
insert into phone_number values(000000010, 927132454);
insert into phone_number values(000000011, 938713541);
insert into phone_number values(000000012, 968103912);
insert into phone_number values(000000013, 926846513);
insert into phone_number values(000000014, 936841324);
insert into phone_number values(000000015, 961351153);
insert into phone_number values(000000016, 923651254);
insert into phone_number values(000000017, 937684635);
insert into phone_number values(000000018, 916353131);
insert into phone_number values(000000019, 918468344);
insert into phone_number values(000000020, 910360480);

insert into client values (000000000);
insert into client values (000000002);
insert into client values (000000003);
insert into client values (000000005);
insert into client values (000000006);
insert into client values (000000007);
insert into client values (000000009);
insert into client values (000000010);
insert into client values (000000014);
insert into client values (000000015);
insert into client values (000000017);
insert into client values (000000020);

insert into veterinary values (000000001, 'Doctor', 'I wanted to be a doctor but I dont like people.');
insert into veterinary values (000000004, 'Critical Care Veterinary', 'Since I was 1, I wanted to be a veterinary!');
insert into veterinary values (000000005, 'Anaesthsiologist', 'Since I was 5, I wanted to be a veterinary!');
insert into veterinary values (000000008, 'Cardiologist', 'Since I was 10, I wanted to be a veterinary!');
insert into veterinary values (000000009, 'Oncologist', 'Since I was 15, I wanted to be a veterinary!');
insert into veterinary values (000000011, 'Parasitologist', 'Since I was 20, I wanted to be a veterinary!');
insert into veterinary values (000000013, 'Toxicologist', 'My mum wanted me to be a veterinary. So here I am.');

insert into assistant values (000000010);
insert into assistant values (000000012);
insert into assistant values (000000016);
insert into assistant values (000000019);

insert into species values ('Dog', 'The domestic dog is the most widely abundant terrestrial carnivore.');
insert into species values ('Bulldog', 'It is a muscular, hefty dog with a wrinkled face and a distinctive pushed-in nose.');
insert into species values ('Pug', 'The Pug is a breed of dog with physically distinctive features of a wrinkly, short-muzzled face, and curled tail.');
insert into species values ('Rottweiler', 'Rottweilers are used as search and rescue dogs, as guard dogs, and as police dogs.');
insert into species values ('Husky', 'Husky is a general name for a sled-type of dog used in northern regions.');
insert into species values ('Afghan Hound', 'The Afghan Hound is a hound with thick, fine, silky coat and a tail with a ring curl at the end.');
insert into species values ('Akita', 'The Akita is a large breed of dog originating from the mountainous regions of northern Japan.');
insert into species values ('Bird', 'Birds have feathers, toothless beaked jaws, hard-shelled eggs and a strong yet lightweight skeleton.');
insert into species values ('Parakeet', 'A parakeet is a small to medium-sized species of parrot with generally long tail feathers.');
insert into species values ('Cockatiel', 'Cockatiels are prized as companion parrots and are relatively easy to breed.');
insert into species values ('Hamster', 'Hamsters are rodents belonging to the subfamily Cricetinae.');
insert into species values ('Cat', 'A cat is a small, typically furry, carnivorous mammal.');
insert into species values ('Siamese', 'The Siamese cat is one of the first distinctly recognized breeds of Asian cat.');
insert into species values ('Donskoy', 'The Donskoy is a mostly hairless cat breed of Russian origin.');
insert into species values ('Fish', 'Fish are gill-bearing aquatic craniate animals that lack limbs with digits.');

insert into generalization_species values ('Bulldog', 'Dog');
insert into generalization_species values ('Pug', 'Dog');
insert into generalization_species values ('Rottweiler', 'Dog');
insert into generalization_species values ('Husky', 'Dog');
insert into generalization_species values ('Afghan Hound', 'Dog');
insert into generalization_species values ('Akita', 'Dog');
insert into generalization_species values ('Parakeet', 'Bird');
insert into generalization_species values ('Cockatiel', 'Bird');
insert into generalization_species values ('Siamese', 'Cat');
insert into generalization_species values ('Donskoy', 'Cat');

insert into animal values ('Puma', 000000000, 'Bulldog', 'Black', 'Male', '1997-12-18', 20);
insert into animal values ('Theo', 000000000, 'Siamese', 'Grey', 'Female', '2000-12-19', 17);
insert into animal values ('Cally', 000000014, 'Parakeet', 'Green', 'Male', '2001-10-16', 17);
insert into animal values ('Doggy', 000000014, 'Dog', 'Cream', 'Female', '2002-09-23', 16);
insert into animal values ('Severin', 000000015, 'Pug', 'Brown', 'Male', '2003-08-29', 15);
insert into animal values ('Wanikiy', 000000015, 'Afghan Hound', 'Golden', 'Female', '2004-07-30', 14);
insert into animal values ('Fluffy', 000000002, 'Akita', 'Brown', 'Male', '2005-06-27', 13);
insert into animal values ('Bonzo', 000000002, 'Donskoy', 'Grey', 'Female', '2006-05-29', 12);
insert into animal values ('Marlie', 000000006, 'Husky', 'White', 'Male', '2007-04-21', 11);
insert into animal values ('Bolt', 000000007, 'Bird', 'yellow', 'Female', '2008-03-19', 10);
insert into animal values ('Spark', 000000003, 'Cockatiel', 'Black', 'Female', '2009-02-05', 9);
insert into animal values ('Garfield', 000000005, 'Cat', 'Orange', 'Male', '2015-01-02', 3);
insert into animal values ('Toby', 000000006, 'Hamster', 'White', 'Male', '2017-10-08', 1);
insert into animal values ('Trojan', 000000006, 'Fish', 'Blue', 'Female', '2017-10-09', 1);
insert into animal values ('Blue', 000000003, 'Bird', 'Blue', 'Female', '2009-02-05', 1);

insert into consult values ('Puma', 000000000, '2017-7-27 09:00:30.75', 's', 'Suffers from obesity.', 'a', 'p', 000000020, 000000001, 35);
insert into consult values ('Puma', 000000000, '2017-8-27 09:00:30.75', 's', 'Extreme obesity. Poor Boy.', 'a', 'p', 000000020, 000000001, 34);
insert into consult values ('Severin', 000000015, '2016-7-28 09:00:30.75', 's', 'o', 'a', 'p', 000000015, 000000001, 17);
insert into consult values ('Severin', 000000015, '2016-7-29 09:00:30.75', 's', 'o', 'a', 'p', 000000015, 000000001, 17);
insert into consult values ('Marlie', 000000006, '2016-11-29 09:00:30.75', 's', 'o', 'a', 'p', 000000020, 000000001, 30);
insert into consult values ('Blue', 000000003, '2016-11-29 09:00:00.75','s', 'o', 'a', 'p', 000000020, 000000001, 1);
insert into consult values ('Bolt', 000000007, '2005-7-29 09:00:30.75', 's', 'o', 'a', 'p', 000000007, 000000009, 20);
insert into consult values ('Fluffy', 000000002, '2005-7-29 09:00:00.75', 's', 'o', 'a', 'p', 000000002, 000000001, 20);
insert into consult values ('Garfield', 000000005, '2005-7-29 09:00:30.75', 's', 'It is an obese cat.', 'a', 'p', 000000005, 000000009, 40);
insert into consult values ('Severin', 000000015, '2005-7-30 09:00:30.75', 's', 'Almost obese but no.', 'a', 'p', 000000015, 000000004, 25);
insert into consult values ('Severin', 000000015, '2005-7-31 09:00:30.75', 's', 'o', 'a', 'p', 000000015, 000000004, 20);
insert into consult values ('Severin', 000000015, '2005-8-29 09:00:30.75', 's', 'o', 'a', 'p', 000000015, 000000005, 20);
insert into consult values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 's', 'o', 'a', 'p', 000000014, 000000008, 26);
insert into consult values ('Theo', 000000000, '2005-10-29 09:00:30.75', 's', 'o', 'a', 'p', 000000000, 000000001, 1);
insert into consult values ('Cally', 000000014, '2005-1-29 09:00:30.75', 's', 'o', 'a', 'p', 000000009, 000000004, 1);
insert into consult values ('Wanikiy', 000000015, '2005-2-27 09:00:30.75', 's', 'o', 'a', 'p', 000000010, 000000001, 31);
insert into consult values ('Bonzo', 000000002, '2005-3-29 09:00:30.75', 's', 'o', 'a', 'p', 000000002, 000000008, 15);
insert into consult values ('Spark', 000000003, '2005-8-29 09:00:30.75', 's', 'o', 'a', 'p', 000000020, 000000013, 1);
insert into consult values ('Toby', 000000006, '2005-9-29 09:00:30.75', 's', 'o', 'a', 'p', 000000020, 000000013, 2);
insert into consult values ('Trojan', 000000006, '2005-10-29 09:00:30.75', 's', 'o', 'a', 'p', 000000006, 000000008, 1);

insert into participation values('Puma', 000000000, '2017-7-27 09:00:30.75', 000000010);
insert into participation values('Puma', 000000000, '2017-8-27 09:00:30.75', 000000010);
insert into participation values('Puma', 000000000, '2017-8-27 09:00:30.75', 000000012);
insert into participation values('Severin', 000000015, '2016-7-28 09:00:30.75', 000000012);
insert into participation values('Theo', 000000000, '2005-10-29 09:00:30.75', 000000012);
insert into participation values('Cally', 000000014, '2005-1-29 09:00:30.75',000000010);
insert into participation values('Cally', 000000014, '2005-1-29 09:00:30.75',000000012);
insert into participation values('Bonzo', 000000002, '2005-3-29 09:00:30.75',000000012);

insert into diagnosis_code values('0000', 'High Blood Pressure');
insert into diagnosis_code values('1111', 'Kidney Failure');
insert into diagnosis_code values('2222', 'Renal disease');
insert into diagnosis_code values('3333', 'Flu');
insert into diagnosis_code values('4444', 'Fever');

insert into medication values('Gaviscom', 'Gaviscom Inc.', 800);
insert into medication values('Ben-u-ron', 'Ben-u-ron Inc.', 1000);
insert into medication values('Ben-u-ron', 'Ben-u-ron Inc.', 500);
insert into medication values('Brufen', 'Brufen Inc.', 100);
insert into medication values('Brufen', 'Brufen Inc.', 50);

insert into consult_diagnosis values ('0000', 'Puma', 000000000, '2017-8-27 09:00:30.75');
insert into consult_diagnosis values ('0000', 'Marlie', 000000006, '2016-11-29 09:00:30.75');
insert into consult_diagnosis values ('0000', 'Trojan', 000000006, '2005-10-29 09:00:30.75');
insert into consult_diagnosis values ('1111', 'Puma', 000000000, '2017-7-27 09:00:30.75');
insert into consult_diagnosis values ('1111', 'Doggy', 000000014, '2005-9-29 09:00:30.75');
insert into consult_diagnosis values ('2222', 'Puma', 000000000, '2017-7-27 09:00:30.75');
insert into consult_diagnosis values ('2222', 'Theo', 000000000, '2005-10-29 09:00:30.75');
insert into consult_diagnosis values ('3333', 'Severin', 000000015, '2016-7-28 09:00:30.75');
insert into consult_diagnosis values ('4444', 'Toby', 000000006, '2005-9-29 09:00:30.75');

insert into prescription values ('0000', 'Puma', 000000000, '2017-8-27 09:00:30.75', 'Gaviscom', 'Gaviscom Inc.', 800, 'One in the morning.');
insert into prescription values ('0000', 'Marlie', 000000006, '2016-11-29 09:00:30.75', 'Brufen', 'Brufen Inc.', 100, 'Every now and then.');
insert into prescription values ('0000', 'Trojan', 000000006, '2005-10-29 09:00:30.75', 'Ben-u-ron', 'Ben-u-ron Inc.', 1000, 'Every once in a while.');
insert into prescription values ('1111', 'Puma', 000000000, '2017-7-27 09:00:30.75', 'Brufen', 'Brufen Inc.', 100, 'Day yes day no.');
insert into prescription values ('1111', 'Doggy', 000000014, '2005-9-29 09:00:30.75', 'Ben-u-ron', 'Ben-u-ron Inc.', 1000, 'After eating.');
insert into prescription values ('2222', 'Puma', 000000000, '2017-7-27 09:00:30.75', 'Ben-u-ron','Ben-u-ron Inc.', 1000, '30 minutes before bed.');
insert into prescription values ('2222', 'Theo', 000000000, '2005-10-29 09:00:30.75', 'Ben-u-ron','Ben-u-ron Inc.', 500, '1 hour before bed.');
insert into prescription values ('4444', 'Toby', 000000006, '2005-9-29 09:00:30.75', 'Brufen','Brufen Inc.', 50, 'When feeling intense pain.');

insert into indicator values ('White Blood Cells', 100, 'milligrams', 'Cells of the immune system that protected the body against foreign invaders.');
insert into indicator values ('Red Blood Cells', 50, 'grams', 'Cells that deliverer oxygen (O2) to the body tissues');
insert into indicator values ('Cholesterol', 200, 'miligrams', 'Organic molecule.');
insert into indicator values ('Erythrocytes', 500, 'grams', 'Cells of the immune system that protected the body against foreign invaders.');
insert into indicator values ('Fatty acids', 110, 'milligrams', 'A carboxylic acid with a long aliphatic chain, which is either saturated or unsaturated.');
insert into indicator values ('Creatinine', 0.6, 'milligrams per deciliter', 'It is a breakdown product of creatine phosphate in muscle.');

insert into proced values ('Puma', 000000000, '2017-7-27 09:00:30.75', 1, 'testing wbc');
insert into proced values ('Puma', 000000000, '2017-7-27 09:00:30.75', 2, 'testing rbc');
insert into proced values ('Puma', 000000000, '2017-7-27 09:00:30.75', 3, 'testing creatinine');
insert into proced values ('Puma', 000000000, '2017-8-27 09:00:30.75', 1, 'testing wbc');
insert into proced values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 1, 'testing creatinine');
insert into proced values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 2, 'radiography');

insert into test_procedure values ('Puma', 000000000, '2017-7-27 09:00:30.75', 1, 'blood');
insert into test_procedure values ('Puma', 000000000, '2017-7-27 09:00:30.75', 2, 'blood');
insert into test_procedure values ('Puma', 000000000, '2017-8-27 09:00:30.75', 1, 'blood');
insert into test_procedure values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 1, 'blood');
insert into test_procedure values ('Puma', 000000000, '2017-7-27 09:00:30.75', 3, 'blood');

insert into produced_indicator values ('Puma', 000000000, '2017-7-27 09:00:30.75', 1, 'White Blood Cells', 1.3);
insert into produced_indicator values ('Puma', 000000000, '2017-7-27 09:00:30.75', 2, 'Red Blood Cells', 500);
insert into produced_indicator values ('Puma', 000000000, '2017-8-27 09:00:30.75', 1, 'White Blood Cells', 1.1);
insert into produced_indicator values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 1, 'Creatinine', 0.7);
insert into produced_indicator values ('Puma', 000000000, '2017-7-27 09:00:30.75', 3, 'Creatinine', 1.1);

insert into performed values ('Puma', 000000000, '2017-7-27 09:00:30.75', 1, 000000010);
insert into performed values ('Puma', 000000000, '2017-7-27 09:00:30.75', 2, 000000016);
insert into performed values ('Puma', 000000000, '2017-7-27 09:00:30.75', 3, 000000019);
insert into performed values ('Puma', 000000000, '2017-8-27 09:00:30.75', 1, 000000016);
insert into performed values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 1, 000000010);
insert into performed values ('Doggy', 000000014, '2005-9-29 09:00:30.75', 2, 000000016);

insert into radiography values ('Doggy',000000014, '2005-9-29 09:00:30.75', 2, '/path/to/file.img');

/*
birth_year pode ser data toda?
gender = male ou female (ou unknown)
test type = blood ou urin
num de procedure incrementar automaticamente
mudar os cabeçalhos das views para darem iguais
