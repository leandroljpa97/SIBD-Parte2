insert into person values
('00000000', 'John Smith', 'Main Street', 'New York', '1000-193'),
('00000001', 'John Smith', 'Second Street', 'Brooklyn', '1001-439'),
('00000002', 'John Doe', 'Main Street', 'Cleveland', '1010-798'),
('00000003', 'Oliver Watts', 'Big Avenue', 'Los Angeles', '1050-375'),
('00000004', 'Chandler Webbs', 'Small Avenue', 'Brooklyn', '1001-373'),
('00000005', 'John Smith', 'Main Street', 'New York', '1000-278'),
('00000006', 'William Lawrence', 'Second Street', 'Brooklyn', '1001-438'),
('00000007', 'Kelly Jenkins', 'Main Street', 'Cleveland', '1010-348'),
('00000008', 'Jacob Chambers', 'Second Street', 'Brooklyn', '1001-230'),
('00000009', 'Harry Spencer', 'Big Avenue', 'Brooklyn', '1001-436'),
('00000010', 'Jack Lawson', 'Third Street', 'California', '1070-089'),
('00000011', 'Rhys Woods', 'Main Street', 'Dallas', '1100-324'),
('00000012', 'Thomas Ress', 'Big Avenue', 'Chicago', '1078-375'),
('00000013', 'George Fraser', 'Small Street', 'Brooklyn', '1001-850'),
('00000014', 'Damian Black', 'Big Avenue', 'Dallas', '1100-279'),
('00000015', 'Joe Fletcher', 'Third Street', 'Houston', '1073-384'),
('00000016', 'Jones', 'Small Avenue', 'Brooklyn', '1001-379'),
('00000017', 'Noah Taylor', 'Small Avenue', 'Fort Worth', '1356-167'),
('00000019', 'Ethan Brown', 'Second Street', 'San Diego', '1263-368'),
('00000020', 'Joseph Davis', 'Third Street', 'Fort Worth', '1356-738');

insert into phone_number values
('00000000', 934368287),
('00000001', 963154632),
('00000002', 926842214),
('00000003', 913546541),
('00000005', 933987048),
('00000006', 966984516),
('00000007', 925424700),
('00000008', 917813568),
('00000009', 933534684),
('00000010', 927132454),
('00000010', 938713541),
('00000010', 968103912),
('00000013', 926846513),
('00000014', 936841324),
('00000015', 961351153),
('00000016', 963154632),
('00000017', 963154632),
('00000019', 918468344),
('00000020', 910360480);

insert into client values
('00000000'),
('00000002'),
('00000003'),
('00000005'),
('00000006'),
('00000007'),
('00000009'),
('00000010'),
('00000014'),
('00000015'),
('00000017'),
('00000020');

insert into veterinary values
('00000001', 'Doctor', 'I wanted to be a doctor but I dont like people.'),
('00000004', 'Critical Care Veterinary', 'Since I was 1, I wanted to be a veterinary!'),
('00000005', 'Anaesthsiologist', 'Since I was 5, I wanted to be a veterinary!'),
('00000008', 'Cardiologist', 'Since I was 10, I wanted to be a veterinary!'),
('00000009', 'Oncologist', 'Since I was 15, I wanted to be a veterinary!'),
('00000011', 'Parasitologist', 'Since I was 20, I wanted to be a veterinary!'),
('00000013', 'Toxicologist', 'My mum wanted me to be a veterinary. So here I am.');

insert into assistant values
('00000010'),
('00000012'),
('00000016'),
('00000019');

insert into species values
('Dog', 'The domestic dog is the most widely abundant terrestrial carnivore.'),
('Bulldog', 'It is a muscular, hefty dog with a wrinkled face and a distinctive pushed-in nose.'),
('Pug', 'The Pug is a breed of dog with physically distinctive features of a wrinkly, short-muzzled face, and curled tail.'),
('Rottweiler', 'Rottweilers are used as search and rescue dogs, as guard dogs, and as police dogs.'),
('Husky', 'Husky is a general name for a sled-type of dog used in northern regions.'),
('Afghan Hound', 'The Afghan Hound is a hound with thick, fine, silky coat and a tail with a ring curl at the end.'),
('Akita', 'The Akita is a large breed of dog originating from the mountainous regions of northern Japan.'),
('Bird', 'Birds have feathers, toothless beaked jaws, hard-shelled eggs and a strong yet lightweight skeleton.'),
('Parakeet bird', 'A parakeet is a small to medium-sized species of parrot with generally long tail feathers.'),
('Cockatiel bird', 'Cockatiels are prized as companion parrots and are relatively easy to breed.'),
('Hamster', 'Hamsters are rodents belonging to the subfamily Cricetinae.'),
('Cat', 'A cat is a small, typically furry, carnivorous mammal.'),
('Siamese', 'The Siamese cat is one of the first distinctly recognized breeds of Asian cat.'),
('Donskoy', 'The Donskoy is a mostly hairless cat breed of Russian origin.'),
('Fish', 'Fish are gill-bearing aquatic craniate animals that lack limbs with digits.');

insert into generalization_species values
('Bulldog', 'Dog'),
('Pug', 'Dog'),
('Rottweiler', 'Dog'),
('Husky', 'Dog'),
('Afghan Hound', 'Dog'),
('Akita', 'Dog'),
('Parakeet bird', 'Bird'),
('Cockatiel bird', 'Bird'),
('Siamese', 'Cat'),
('Donskoy', 'Cat');

insert into animal values
('Puma', '00000000', 'Bulldog', 'Black', 'Male', '1997-12-18', 20),
('Theo', '00000000', 'Siamese', 'Grey', 'Female', '2000-12-19', 17),
('Cally', '00000014', 'Parakeet bird', 'Green', 'Male', '2001-10-16', 17),
('Doggy', '00000014', 'Dog', 'Cream', 'Female', '2002-09-23', 16),
('Severin', '00000015', 'Pug', 'Brown', 'Male', '2003-08-29', 15),
('Wanikiy', '00000015', 'Afghan Hound', 'Golden', 'Female', '2004-07-30', 14),
('Fluffy', '00000002', 'Akita', 'Brown', 'Male', '2005-06-27', 13),
('Bonzo', '00000002', 'Rottweiler', 'Grey', 'Female', '2006-05-29', 12),
('Marlie', '00000006', 'Husky', 'White', 'Male', '2007-04-21', 11),
('Bolt', '00000007', 'Bird', 'Yellow', 'Female', '2008-03-19', 10),
('Spark', '00000003', 'Cockatiel bird', 'Black', 'Female', '2009-02-05', 9),
('Garfield', '00000005', 'Cat', 'Orange', 'Male', '2015-01-02', 3),
('Toby', '00000006', 'Husky', 'White', 'Male', '2017-10-08', 1),
('Trojan', '00000006', 'Fish', 'Blue', 'Female', '2017-10-09', 1),
('Blue', '00000003', 'Bird', 'Blue', 'Female', '2009-02-05', 1),
('Blue', '00000002', 'Bird', 'Blue', 'Female', '2009-02-05', 1),
('Foxy', '00000005', 'Bulldog', 'Brown', 'Male', '2008-02-05', 2),
('Goofy', '00000005', 'Husky', 'Brown', 'Male', '2008-02-05', 2),
('Nugget', '00000005', 'Rottweiler', 'Brown', 'Female', '2007-02-05', 3);

insert into consult values
('Puma', '00000000', '2017-7-27 10:30:00.75', 's', 'Suffers from obesity.', 'a', 'p', '00000020', '00000001', 35),
('Puma', '00000000', '2017-8-27 09:00:00.75', 's', 'Extreme obesity. Poor Boy.', 'a', 'p', '00000020', '00000001', 34),
('Severin', '00000015', '2016-7-28 11:00:00.75', 's', 'o', 'a', 'p', '00000015', '00000001', 17),
('Severin', '00000015', '2016-7-29 11:45:00.75', 's', 'Obese but working on it.', 'a', 'p', '00000015', '00000001', 40),
('Marlie', '00000006', '2016-11-29 19:00:00.75', 's', 'o', 'a', 'p', '00000020', '00000001', 30),
('Blue', '00000003', '2016-11-29 09:00:00.75','s', 'o', 'a', 'p', '00000020', '00000001', 1),
('Blue', '00000002', '2016-11-30 09:00:00.75','s', 'o', 'a', 'p', '00000002', '00000001', 1),
('Bolt', '00000007', '2005-7-29 09:00:00.75', 's', 'o', 'a', 'p', '00000007', '00000009', 20),
('Fluffy', '00000002', '2005-7-29 09:00:00.75', 's', 'o', 'a', 'p', '00000002', '00000001', 20),
('Garfield', '00000005', '2005-7-29 09:00:00.75', 's', 'It is an obese cat.', 'a', 'p', '00000005', '00000009', 40),
('Severin', '00000015', '2018-7-30 09:00:00.75', 's', 'Almost obese but no.', 'a', 'p', '00000015', '00000004', 25),
('Severin', '00000015', '2005-7-31 09:00:00.75', 's', 'o', 'a', 'p', '00000015', '00000004', 20),
('Severin', '00000015', '2005-8-29 09:00:00.75', 's', 'o', 'a', 'p', '00000015', '00000005', 20),
('Doggy', '00000014', '2005-9-29 12:30:00.75', 's', 'o', 'a', 'p', '00000014', '00000008', 26),
('Theo', '00000000', '2005-10-29 15:30:00.75', 's', 'o', 'a', 'p', '00000000', '00000008', 1),
('Cally', '00000014', '2005-1-29 09:00:00.75', 's', 'o', 'a', 'p', '00000009', '00000004', 1),
('Wanikiy', '00000015', '2005-2-27 09:00:00.75', 's', 'o', 'a', 'p', '00000010', '00000001', 31),
('Bonzo', '00000002', '2005-3-29 09:00:00.75', 's', 'o', 'a', 'p', '00000002', '00000008', 15),
('Spark', '00000003', '2005-8-29 09:00:00.75', 's', 'o', 'a', 'p', '00000020', '00000013', 1),
('Toby', '00000006', '2005-9-29 17:40:00.75', 's', 'o', 'a', 'p', '00000020', '00000013', 2),
('Trojan', '00000006', '2005-10-29 16:30:00.75', 's', 'o', 'a', 'p', '00000005', '00000008', 1),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 's', 'o', 'a', 'p', '00000005', '00000008', 1),
('Bonzo', '00000002', '2017-3-29 10:30:00.75', 's', 'o', 'a', 'p', '00000002', '00000008', 15),
('Spark', '00000003', '2017-8-29 11:30:00.75', 's', 'o', 'a', 'p', '00000020', '00000013', 1),
('Foxy', '00000005', '2018-1-10 11:00:00.75', 's', 'o', 'a', 'p', '00000005', '00000013', 10),
('Goofy', '00000005', '2018-1-10 12:30:00.75', 's', 'o', 'a', 'p', '00000005', '00000013', 10),
('Nugget', '00000005', '2018-1-10 14:00:00.75', 's', 'o', 'a', 'p', '00000005', '00000013', 15),
('Wanikiy', '00000015', '2018-2-27 09:00:00.75', 's', 'o', 'a', 'p', '00000010', '00000001', 31);

insert into participation values
('Puma', '00000000', '2017-7-27 10:30:00.75', '00000010'),
('Puma', '00000000', '2017-8-27 09:00:00.75', '00000010'),
('Puma', '00000000', '2017-8-27 09:00:00.75', '00000012'),
('Severin', '00000015', '2016-7-28 11:00:00.75', '00000012'),
('Theo', '00000000', '2005-10-29 15:30:00.75', '00000012'),
('Cally', '00000014', '2005-1-29 09:00:00.75','00000010'),
('Cally', '00000014', '2005-1-29 09:00:00.75','00000012'),
('Bonzo', '00000002', '2005-3-29 09:00:00.75','00000012'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', '00000010'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', '00000012'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', '00000016'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', '00000019'),
('Bonzo', '00000002', '2017-3-29 10:30:00.75', '00000019');

insert into diagnosis_code values
('0000', 'High Blood Pressure'),
('1111', 'Kidney Failure'),
('2222', 'Cron disease'),
('3333', 'Flu'),
('4444', 'Fever'),
('5555', 'Broken Nose'),
('6666', 'End-stage renal disease');

insert into medication values
('Gaviscom', 'Gaviscom Inc.', 800),
('Ben-u-ron', 'Ben-u-ron Inc.', 1000),
('Ben-u-ron', 'Ben-u-ron Inc.', 500),
('Brufen', 'Brufen Inc.', 100),
('Brufen', 'Brufen Inc.', 50);

insert into consult_diagnosis values
('0000', 'Puma', '00000000', '2017-8-27 09:00:00.75'),
('1111', 'Puma', '00000000', '2017-7-27 10:30:00.75'),
('2222', 'Puma', '00000000', '2017-7-27 10:30:00.75'),
('0000', 'Foxy', '00000005', '2018-1-10 11:00:00.75'),
('1111', 'Foxy', '00000005', '2018-1-10 11:00:00.75'),
('3333', 'Severin', '00000015', '2016-7-28 11:00:00.75'),
('0000', 'Wanikiy', '00000015', '2005-2-27 09:00:00.75'),
('1111', 'Wanikiy', '00000015', '2005-2-27 09:00:00.75'),
('0000', 'Wanikiy', '00000015', '2018-2-27 09:00:00.75'),
('2222', 'Marlie', '00000006', '2016-11-29 19:00:00.75'),
('3333', 'Marlie', '00000006', '2016-11-29 19:00:00.75'),
('2222', 'Goofy', '00000005', '2018-1-10 12:30:00.75'),
('4444', 'Bonzo', '00000002', '2017-3-29 10:30:00.75'),
('5555', 'Bonzo', '00000002', '2017-3-29 10:30:00.75'),
('4444', 'Nugget', '00000005', '2018-1-10 14:00:00.75'),
('5555', 'Nugget', '00000005', '2018-1-10 14:00:00.75'),
('5555', 'Fluffy', '00000002', '2005-7-29 09:00:00.75'),
('0000', 'Trojan', '00000006', '2005-10-29 16:30:00.75'),
('1111', 'Doggy', '00000014', '2005-9-29 12:30:00.75'),
('2222', 'Theo', '00000000', '2005-10-29 15:30:00.75'),
('4444', 'Toby', '00000006', '2005-9-29 17:40:00.75'),
('0000', 'Toby', '00000006', '2005-9-29 17:40:00.75'),
('3333', 'Spark', '00000003', '2017-8-29 11:30:00.75');

insert into prescription values
('0000', 'Puma', '00000000', '2017-8-27 09:00:00.75', 'Gaviscom', 'Gaviscom Inc.', 800, 'One in the morning.'),
('0000', 'Foxy', '00000005', '2018-1-10 11:00:00.75', 'Brufen', 'Brufen Inc.', 100, 'Every now and then.'),
('0000', 'Trojan', '00000006', '2005-10-29 16:30:00.75', 'Ben-u-ron', 'Ben-u-ron Inc.', 1000, 'Every once in a while.'),
('1111', 'Puma', '00000000', '2017-7-27 10:30:00.75', 'Brufen', 'Brufen Inc.', 100, 'Day yes day no.'),
('1111', 'Doggy', '00000014', '2005-9-29 12:30:00.75', 'Ben-u-ron', 'Ben-u-ron Inc.', 1000, 'After eating.'),
('2222', 'Puma', '00000000', '2017-7-27 10:30:00.75', 'Ben-u-ron','Ben-u-ron Inc.', 1000, '30 minutes before bed.'),
('2222', 'Theo', '00000000', '2005-10-29 15:30:00.75', 'Ben-u-ron','Ben-u-ron Inc.', 500, '1 hour before bed.'),
('4444', 'Toby', '00000006', '2005-9-29 17:40:00.75', 'Brufen','Brufen Inc.', 50, 'When feeling intense pain.');

insert into indicator values
('White Blood Cells', 100, 'milligrams', 'Cells of the immune system that protected the body against foreign invaders.'),
('Red Blood Cells', 50, 'grams', 'Cells that deliverer oxygen (O2) to the body tissues'),
('Erythrocytes', 500, 'grams', 'Cells of the immune system that protected the body against foreign invaders.'),
('Fatty acids', 110, 'milligrams', 'A carboxylic acid with a long aliphatic chain, which is either saturated or unsaturated.'),
('Creatinine level', 0.6, 'milligrams per deciliter', 'It is a breakdown product of creatine phosphate in muscle.'),
('Cholesterol', 200, 'milligrams', 'Organic molecule.'),
('Insulin', 350, 'milligrams', 'It is a peptide hormone produced by beta cells of the pancreatic islets.');

insert into proced values
('Puma', '00000000', '2017-7-27 10:30:00.75', 1, 'testing wbc'),
('Puma', '00000000', '2017-7-27 10:30:00.75', 2, 'testing rbc'),
('Puma', '00000000', '2017-7-27 10:30:00.75', 3, 'testing creatinine'),
('Puma', '00000000', '2017-8-27 09:00:00.75', 1, 'testing wbc'),
('Doggy', '00000014', '2005-9-29 12:30:00.75', 1, 'testing creatinine'),
('Doggy', '00000014', '2005-9-29 12:30:0.75', 2, 'radiography'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 1, 'radiography'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 2, 'testing wbc'),
('Bonzo', '00000002', '2017-3-29 10:30:00.75', 1, 'radiography');

insert into test_procedure values
('Puma', '00000000', '2017-7-27 10:30:00.75', 1, 'blood'),
('Puma', '00000000', '2017-7-27 10:30:00.75', 2, 'blood'),
('Puma', '00000000', '2017-8-27 09:00:00.75', 1, 'blood'),
('Doggy', '00000014', '2005-9-29 12:30:00.75', 1, 'blood'),
('Puma', '00000000', '2017-7-27 10:30:00.75', 3, 'blood'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 2, 'blood');


insert into produced_indicator values
('Puma', '00000000', '2017-7-27 10:30:00.75', 1, 'White Blood Cells', 1.3),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 2, 'White Blood Cells', 1.4),
('Puma', '00000000', '2017-7-27 10:30:00.75', 2, 'Red Blood Cells', 500),
('Puma', '00000000', '2017-8-27 09:00:00.75', 1, 'White Blood Cells', 1.1),
('Doggy', '00000014', '2005-9-29 12:30:00.75', 1, 'Creatinine level', 0.7),
('Puma', '00000000', '2017-7-27 10:30:00.75', 3, 'Creatinine level', 1.1);

insert into performed values
('Puma', '00000000', '2017-7-27 10:30:00.75', 1, '00000010'),
('Puma', '00000000', '2017-7-27 10:30:00.75', 2, '00000016'),
('Puma', '00000000', '2017-7-27 10:30:00.75', 3, '00000019'),
('Puma', '00000000', '2017-8-27 09:00:00.75', 1, '00000016'),
('Doggy', '00000014', '2005-9-29 12:30:00.75', 1, '00000010'),
('Doggy', '00000014', '2005-9-29 12:30:00.75', 2, '00000016'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 1, '00000010'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 2, '00000016'),
('Bonzo', '00000002', '2017-3-29 10:30:00.75', 1, '00000019');

insert into radiography values
('Doggy','00000014', '2005-9-29 12:30:00.75', 2, '/path/to/file.img'),
('Trojan', '00000006', '2017-10-29 09:30:00.75', 1, '/path/to/file.img'),
('Bonzo', '00000002', '2017-3-29 10:30:00.75', 1, '/path/to/file.img');
