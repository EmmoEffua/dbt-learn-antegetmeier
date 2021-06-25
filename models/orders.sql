with 
  stg_orders as (
    select customer_id, order_id  
    from {{ ref('stg_orders')}}
) 
, stg_payments as (
    select 
          payment_order_id
        , sum(payment_amount) as payment_amount  
    from {{ ref('stg_payments') }} 
    where payment_status <> 'fail'
    group by payment_order_id
)    
, final as (
    select 
          od.order_id
        , od.customer_id
        , pm.payment_amount  
    from stg_orders as od
    left outer join stg_payments as pm 
    on od.order_id = pm.payment_order_id 
)

 select *
 from final
 order by order_id, customer_id