{{ config(
    materialized='table' 
) }}
 select * from 
    {{source('stagingfiles','COUNTRY_REGION')}}
        