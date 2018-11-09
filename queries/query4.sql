select name, VAT, address_street, address_city, address_zip
from person natural join client
where VAT not in (select a.VAT from animal a);
