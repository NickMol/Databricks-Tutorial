CREATE MATERIALIZED VIEW dev.gold.dimcustomer AS
SELECT
    id as CustomerId,
    name as CustomerName,
    email as CustomerEmail,
    city as CustomerCity
FROM dev.silver.customers
WHERE name like "%l%"