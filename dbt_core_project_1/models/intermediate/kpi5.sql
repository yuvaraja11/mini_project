{{ config(
    materialized='table' 
) }}
WITH calculate_first_year AS(
  SELECT  
      customer_ID,
      payment_month,
      first_value(payment_month) over (partition by customer_ID order by payment_month)  as fv 
      FROM {{ref('stg_transactions')}} 

),
getuniq_customer  as (
     SELECT Distinct * 
     FROM calculate_first_year
     WHERE fv=payment_month
),
getsepyear as(
     SELECT customer_ID,
     year(payment_month) as yeartomatch,
     fv 
     FROM getuniq_customer
)
SELECT
     yeartomatch,
     count(yeartomatch) as total_customer
     FROM  getsepyear  
     GROUP BY yeartomatch 
     ORDER BY yeartomatch