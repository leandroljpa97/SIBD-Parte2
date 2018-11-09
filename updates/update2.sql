update test_procedure
  natural join produced_indicator
  inner join indicator on produced_indicator.indicator_name = indicator.name
set reference_value = reference_value * 1.1
where units = 'milligrams' and type = 'blood';
