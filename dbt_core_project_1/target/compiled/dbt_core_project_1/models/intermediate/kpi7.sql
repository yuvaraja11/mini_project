
    
WITH customer_revenue AS (
    SELECT
        customer_id,
        Round(SUM(revenue),2) AS total_revenue
    FROM PROJECT.staging.stg_transactions
    GROUP BY customer_id
),
 cte12 as(
 SELECT
    customer_id,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS rev_rank
FROM customer_revenue
WHERE total_revenue is not null
 )
 SELECT  c.customer_id,
    c.total_revenue,
    c.rev_rank as rank_revenue,
    cu.customer_name
    FROM cte12 as c 
inner join PROJECT.staging.stg_customers as cu on c.customer_id=cu.customer_id ORDER BY Rev_rank