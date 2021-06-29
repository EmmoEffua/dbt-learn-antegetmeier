

select 
    insurance_number
  , {{dbt_utils.pivot(
        column = 'customer_role'
      , values = ['VP', 'VN', 'ZA']
      , agg = 'max'
      , then_value = 'customer_name'
      , else_value = 'null'
      , prefix = 'CUSTOMER_NAME_'
    )
    }}
from {{ ref('pivot_src')}}
group by insurance_number
