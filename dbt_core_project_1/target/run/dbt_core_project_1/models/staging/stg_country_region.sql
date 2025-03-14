
  
    

        create or replace transient table PROJECT.staging.stg_country_region
         as
        (
 select * from 
    ASSESSMENT_1.DBO.COUNTRY_REGION
        );
      
  