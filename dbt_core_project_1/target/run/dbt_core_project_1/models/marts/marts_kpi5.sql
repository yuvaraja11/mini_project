
  
    

        create or replace transient table PROJECT.marts.marts_kpi5
         as
        (SELECT * 
FROM PROJECT.intermediate.kpi5
        );
      
  