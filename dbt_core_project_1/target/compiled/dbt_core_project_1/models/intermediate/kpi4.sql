
WITH calculate_revenue_by_each_month AS(
      SELECT
          product_id,
          year(payment_month)as yearofdate,
          month(payment_month) as monthofdate,
          ROUND(sum(revenue),2)as curr_revenue 
          FROM PROJECT.staging.stg_transactions 
          GROUP BY yearofdate,monthofdate,product_id 
          GROUP BY product_id,yearofdate,monthofdate
)
,prev_and_curr AS
(     SELECT * ,
           LAG (curr_revenue,1)over(partition by product_id ORDER by product_id,yearofdate,monthofdate ) AS prev_rev 
           FROM calculate_revenue_by_each_month 
)
    SELECT *, 
    CASE WHEN prev_rev>curr_revenue THEN 'contraction' else 'expansion' end as revenue_over_month,
    CASE WHEN prev_rev>curr_revenue THEN 'LOSS' else 'PROFIT' end as PROFITORLOSS,
    CASE WHEN prev_rev>curr_revenue THEN prev_rev-curr_revenue else curr_revenue-prev_rev end as amount
from prev_and_curr