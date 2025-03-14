{{ config(
    materialized='table' 
) }}
WITH cte3 as (
     SELECT * from 
     {{source('stagingfiles','PRODUCTS')}}
      where PRODUCT_ID Is not null
)
    SELECT distinct PRODUCT_ID, 
        TRIM(PRODUCT_FAMILY) AS PRODUCT_FAMILY, 
        TRIM(PRODUCT_SUB_FAMILY) AS PRODUCT_SUB_FAMILY, 
    from cte3