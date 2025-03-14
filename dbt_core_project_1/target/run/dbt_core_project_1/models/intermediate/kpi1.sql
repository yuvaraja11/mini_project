
  
    

        create or replace transient table PROJECT.intermediate.kpi1
         as
        (
    
with cte1 as
(  select max(payment_month) as maxd 
   from PROJECT.staging.stg_transactions),
cte2 as(
    select dateadd(month,-1,maxd) as dtd from cte1
    ),
cte3 as(
  select customer_id,
  min(payment_month) as startofpurchase,
  max(payment_month) as lastofpurchase 
  from PROJECT.staging.stg_transactions
  group by customer_id
),
cte5 as(
select cust.customer_id,
       cust.startofpurchase,
       cust.lastofpurchase,
       case 
           when dt.dtd>cust.lastofpurchase then 'CHURNED_CUSTOMER'
           when cust.startofpurchase=cust.lastofpurchase then 'NEW_CUSTOMER'
           else 'EXISTING_CUSTOMER' end as customer_type
from cte3 as cust inner join cte2 as dt on 1=1)
select Customer_type,count(*) as customer_count from cte5 group by Customer_type
        );
      
  