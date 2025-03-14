
  create or replace   view PROJECT.STAGING.marts.transactions
  
   as (
    select * from PROJECT.STAGING.stg_transactions
  );

