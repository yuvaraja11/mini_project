
  
    

        create or replace transient table PROJECT.marts.marts_kpi2
         as
        (SELECT * FROM PROJECT.intermediate.kpi2
        );
      
  