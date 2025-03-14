
  
    

        create or replace transient table PROJECT.STAGING.stg_transactions
         as
        (
with cte5 as(
     select * from 
     ASSESSMENT_1.DBO.TRANSACTIONS
     where CUSTOMER_ID is not null
)
,cte6 as (
    select *,case when REVENUE_TYPE='True' then 1 else 0 end as REVENUE_TYPE_INT from  cte5
),cte7 as (
 SELECT 
    CUSTOMER_ID, 
    TRIM(PRODUCT_ID) AS PRODUCT_ID, 
    PAYMENT_MONTH, 
    REVENUE_TYPE_INT AS REVENUE_TYPE, 
    REVENUE, 
    TRIM(QUANTITY) AS QUANTITY, 
    TRIM(DIMENSION_1) AS DIMENSION_1, 
    TRIM(DIMENSION_2) AS DIMENSION_2, 
    TRIM(DIMENSION_3) AS DIMENSION_3, 
    TRIM(DIMENSION_4) AS DIMENSION_4, 
    TRIM(DIMENSION_5) AS DIMENSION_5, 
    TRIM(DIMENSION_6) AS DIMENSION_6, 
    TRIM(DIMENSION_7) AS DIMENSION_7, 
    TRIM(DIMENSION_8) AS DIMENSION_8, 
    TRIM(DIMENSION_9) AS DIMENSION_9, 
    TRIM(DIMENSION_10) AS DIMENSION_10, 
    TRIM(COMPANIES) AS COMPANY 
FROM cte6)
select DISTINCT * from cte7
        );
      
  