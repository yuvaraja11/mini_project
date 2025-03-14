
  
    

        create or replace transient table PROJECT.marts.marts_kpi4
         as
        (SELECT * 
FROM PROJECT.intermediate.kpi4
        );
      
  