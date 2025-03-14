
  
    

        create or replace transient table PROJECT.intermediate.kpi4
         as
        (
with calculate_revenue_by_each_month as(
      select 
          product_id,
          year(payment_month)as yearofdate,
          month(payment_month) as monthofdate,
          ROUND(sum(revenue),2)as curr_revenue 
          from PROJECT.staging.stg_transactions 
          group by yearofdate,monthofdate,product_id 
          order by product_id,yearofdate,monthofdate
)
,prev_and_curr as
(     select * ,
           LAG (curr_revenue,1)over(partition by product_id order by product_id,yearofdate,monthofdate ) as prev_rev 
           from  calculate_revenue_by_each_month 
)
    select *, 
    case when prev_rev>curr_revenue then 'contraction' else 'expansion' end as revenue_over_month,
    case when prev_rev>curr_revenue then 'LOSS' else 'PROFIT' end as PROFITORLOSS,
    case when prev_rev>curr_revenue then prev_rev-curr_revenue else curr_revenue-prev_rev end as amount
from prev_and_curr
        );
      
  