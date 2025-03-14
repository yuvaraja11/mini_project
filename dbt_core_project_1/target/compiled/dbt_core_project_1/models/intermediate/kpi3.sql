
 
WITH CURR as (
    SELECT
        customer_id,
        revenue,
        lag(revenue) over (partition by customer_id order by PAYMENT_MONTH) as previous_revenue
    from PROJECT.staging.stg_transactions
),
LASTAS (
 SELECT
        customer_id,
        SUM(revenue) AS total_revenue,  
        sum(previous_revenue) as prev_total_revenue,
        CASE WHEN total_revenue > prev_total_revenue THEN total_revenue-prev_total_revenue ELSE 0 END AS expansion_revenue,  
        CASE WHEN total_revenue < prev_total_revenue THEN prev_total_revenue-total_revenue ELSE 0 END AS contraction_revenue  
    FROM CURR
    GROUP BY 1
),
SELECT * FROM LASTAS