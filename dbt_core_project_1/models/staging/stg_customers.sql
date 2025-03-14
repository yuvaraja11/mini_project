{{ config(
    materialized='table' 
) }}
WITH cte1 as(
    SELECT * from 
    {{source('stagingfiles','CUSTOMERS')}}
     where COMPANY is not null and CUSTOMER_ID is not null
  )
  ,cte2 as(
        SELECT * ,
        ROW_NUMBER() OVER (partition by CUSTOMER_ID order by CUSTOMER_ID )as rn 
       from cte1 
  )
SELECT  CUSTOMER_ID,TRIM(CUSTOMERNAME) as CUSTOMER_NAME ,TRIM(COMPANY) as COMPANY
from cte2 where rn=1