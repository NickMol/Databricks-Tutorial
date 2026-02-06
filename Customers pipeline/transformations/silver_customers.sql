CREATE OR REFRESH STREAMING TABLE dev.silver.customers;

CREATE FLOW customers_cdc_flow AS AUTO CDC INTO dev.silver.customers
FROM STREAM read_files(
  "/Volumes/dev/bronze/customers",
  format => "parquet",
  inferColumnTypes => "true"
)
KEYS (id)
APPLY AS DELETE WHEN deletedflag = true
SEQUENCE BY modified_on
COLUMNS * EXCEPT (_rescued_data, modified_on)
STORED AS SCD TYPE 1;