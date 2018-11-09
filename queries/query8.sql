select name
from person natural join client
where VAT in(
  select VAT from veterinary
  union
  select VAT from assistant);
