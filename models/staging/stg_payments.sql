select 
      id as payment_id
    , orderid as payment_order_id
    , paymentmethod as payment_method
    , status as payment_status
    , amount*0.01 as payment_amount
    , created as payment_created
    , _batched_at payment_loadtimestamp
from raw.stripe.payment