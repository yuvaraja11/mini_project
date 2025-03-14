select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select * from PROJECT.staging.stg_transactions
where customer_id is not null
      
    ) dbt_internal_test