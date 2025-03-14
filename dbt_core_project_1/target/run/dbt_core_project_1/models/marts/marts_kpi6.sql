
  
    

        create or replace transient table PROJECT.marts.marts_kpi6
         as
        (SELECT * 
FROM PROJECT.intermediate.kpi6
        );
      
  