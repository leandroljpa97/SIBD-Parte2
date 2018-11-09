create or replace view dim_date as(
 select distinct date_timestamp,
 DAY(date_timestamp) as day,
 MONTH(date_timestamp) as month,
 YEAR(date_timestamp) as year
 from consult
);
