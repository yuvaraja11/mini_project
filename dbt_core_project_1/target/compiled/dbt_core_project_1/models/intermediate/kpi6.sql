
    
WITH prod_revenue AS (
    SELECT
        product_id,
        ROUND(SUM(revenue),2) AS tot_revenue
    FROM PROJECT.staging.stg_transactions
    GROUP BY product_id
),
 cte12 as(
 SELECT
    product_id,
    tot_revenue,
    RANK() OVER (ORDER BY tot_revenue DESC) AS revenue_rank
FROM prod_revenue
 )
 SELECT Distinct c.product_id,
    c.tot_revenue,
    c.revenue_rank,
    p.product_family
    from cte12 as c 
inner join PROJECT.staging.stg_products as p on c.product_id=p.product_id ORDER BY Revenue_rank