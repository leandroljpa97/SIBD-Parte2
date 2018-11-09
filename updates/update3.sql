delete from client where VAT in(select VAT from person where name = 'John Smith');
