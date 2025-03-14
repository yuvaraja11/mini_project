select * from {{ref('stg_transactions')}}
where customer_id is not null