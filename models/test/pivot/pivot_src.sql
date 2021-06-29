with 
src as
(
          select '1234' as insurance_number, 'Anton' as customer_name, 'VP' as customer_role
union all select '1234' as insurance_number, 'Anton' as customer_name, 'VN' as customer_role
union all select '1234' as insurance_number, 'Berta' as customer_name, 'ZA' as customer_role
union all select '4567' as insurance_number, 'Caesar' as customer_name, 'VP' as customer_role
union all select '4567' as insurance_number, 'Caesar_1' as customer_name, 'VP' as customer_role
union all select '4567' as insurance_number, 'Dora' as customer_name, 'VN' as customer_role
union all select '4567' as insurance_number, 'Emil' as customer_name, 'TU' as customer_role
)

select *
from src