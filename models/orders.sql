with 
  payments as (
    select 
          order_id
        , sum(payment_amount) as payment_amount  
    from {{ ref('stg_payments') }} 
    where payment_status <> 'fail'
    group by order_id
)
, stg_orders as (
    select customer_id, order_id  
    from {{ ref('stg_orders')}}
)    
, final as (
    select 
          pm.order_id
        , od.customer_id
        , pm.payment_amount  
    from stg_orders as od
    left outer join payments as pm 
    on od.order_id = pm.order_id 
)

 select *
 from final
 order by order_id, customer_id