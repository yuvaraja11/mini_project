
    
WITH cte1 AS
(  SELECT 
   max(payment_month) as maxd 
   FROM PROJECT.staging.stg_transactions),
cte2 AS(
    SELECT
    dateadd(month,-1,maxd) AS dtd 
    FROM cte1
    ),
cte3 AS(
  SELECT 
  customer_id,
  min(payment_month) AS startofpurchase,
  max(payment_month) AS lastofpurchase 
  FROM PROJECT.staging.stg_transactions
  GROUP BY customer_id
),
cte5 AS(
select 
       cust.customer_id,
       cust.startofpurchase,
       cust.lastofpurchase,
       CASE
           WHEN dt.dtd>cust.lastofpurchase THEN 'CHURNED_CUSTOMER'
           WHEN cust.startofpurchase=cust.lastofpurchase THEN 'NEW_CUSTOMER'
           ELSE 'EXISTING_CUSTOMER' END AS customer_type
FROM cte3 as cust inner join cte2 as dt on 1=1)
SELECT Customer_type,count(*) as customer_count FROM cte5 GROUP BY Customer_type