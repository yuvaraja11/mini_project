
  
    

        create or replace transient table PROJECT.STAGING.stg_customers
         as
        (
with cte1 as(
    select * from 
    ASSESSMENT_1.DBO.CUSTOMERS
     where COMPANY is not null and CUSTOMER_ID is not null
  )
  ,cte2 as(
        select * ,
        ROW_NUMBER() OVER (partition by CUSTOMER_ID order by CUSTOMER_ID )as rn 
       from cte1 
  )
select  CUSTOMER_ID,TRIM(CUSTOMERNAME) as CUSTOMER_NAME ,TRIM(COMPANY) as COMPANY
from cte2 where rn=1
        );
      
  