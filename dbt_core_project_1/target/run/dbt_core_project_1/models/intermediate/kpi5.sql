
  
    

        create or replace transient table PROJECT.intermediate.kpi5
         as
        (
with calculate_first_year as(
  select  
      customer_ID,
      payment_month,
      first_value(payment_month) over (partition by customer_ID order by payment_month)  as fv 
      from PROJECT.staging.stg_transactions 

),
getuniq_customer  as (
     select Distinct * 
     from calculate_first_year
     where fv=payment_month
),
getsepyear as(
     select customer_ID,
     year(payment_month) as yeartomatch,
     fv 
     from getuniq_customer
)
select 
     yeartomatch,
     count(yeartomatch) as total_customer
     from  getsepyear  
     group by yeartomatch 
     order by yeartomatch
        );
      
  