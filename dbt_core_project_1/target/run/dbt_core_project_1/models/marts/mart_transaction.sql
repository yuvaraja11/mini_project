
  create or replace   view PROJECT.mart.mart_transaction
  
   as (
    select CUSTOMER_ID from PROJECT.staging.stg_transactions
  );

