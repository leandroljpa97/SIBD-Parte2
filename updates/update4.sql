update (consult_diagnosis natural join test_procedure natural join produced_indicator)
set code = (select code from diagnosis_code where name = 'end-stage renal disease'),
  date_timestamp = date_timestamp,
  name = name,
  VAT_owner = VAT_owner
where code = (select code from diagnosis_code where name = 'kidney failure')
  and type = 'blood'
  and indicator_name = 'creatinine level'
  and value > 1;
