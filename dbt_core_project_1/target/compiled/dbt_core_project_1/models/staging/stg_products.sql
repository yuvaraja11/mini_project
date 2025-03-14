
with cte3 as (
     select * from 
     ASSESSMENT_1.DBO.PRODUCTS
      where PRODUCT_ID Is not null
)
    select distinct PRODUCT_ID, 
        TRIM(PRODUCT_FAMILY) AS PRODUCT_FAMILY, 
        TRIM(PRODUCT_SUB_FAMILY) AS PRODUCT_SUB_FAMILY, 
    from cte3