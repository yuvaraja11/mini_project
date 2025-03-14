
  create or replace   view PROJECT.STAGING.mart.transaction
  
   as (
    select * from PROJECT.STAGING.stg_transactions
  );

