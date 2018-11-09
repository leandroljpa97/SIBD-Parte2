select
  count(distinct par.name, par.VAT_owner, par.date_timestamp, par.VAT_assistant)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_assistants,
  count(distinct proced.name, proced.VAT_owner, proced.date_timestamp, proced.num)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_procedures,
  count(distinct cd.code, cd.name, cd.VAT_owner, cd.date_timestamp)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_diagnostic_codes,
  count(distinct p.name, p.VAT_owner, p.date_timestamp, p.code, p.name_med, p.lab, p.dosage)/count(distinct con.name, con.VAT_owner, con.date_timestamp) as average_prescriptions
from (consult as con)
natural left outer join (participation as par)
natural left outer join (consult_diagnosis as cd)
natural left outer join (prescription as p)
natural left outer join proced
where YEAR(date_timestamp) = 2017;
