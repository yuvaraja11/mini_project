
  
    

        create or replace transient table PROJECT.marts.martskpi1
         as
        (SELECT * FROM PROJECT.intermediate.kpi1
        );
      
  