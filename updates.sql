--1
update person natural join client
set address_street='Rua da Bela Vista', address_city='Lisboa', address_zip='2695'
where name='John Smith'

--2
update  test_procedure natural join produced_indicator inner join indicator  on produced_indicator.indicator_name=indicator.name
set reference_value= reference_value*1.1
where units='milligrams' and type='blood';

--3
delete from client where VAT in(select VAT from person where name = 'John Smith' );

--4
update (consult_diagnosis natural join test_procedure natural join produced_indicator)
set code = (select code from diagnosis_code where name = 'end-stage renal disease'),
  date_timestamp = date_timestamp,
  name = name,
  VAT_owner = VAT_owner
where code = (select code from diagnosis_code where name = 'kidney failure')
  and type = 'blood'
  and indicator_name = 'creatinine level'
  and value > 1;
