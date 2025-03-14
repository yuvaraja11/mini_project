
  
    

        create or replace transient table PROJECT.marts.marts_kpi7
         as
        (SELECT * 
FROM PROJECT.intermediate.kpi7
        );
      
  