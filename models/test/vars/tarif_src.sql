with 
src as
(
          select 1010 as tarif_code, 'LV_Standard'        as tarif_name, 'LV' as tarif_kind
union all select 1020 as tarif_code, 'LV_Risiko'          as tarif_name, 'LV' as tarif_kind
union all select 1030 as tarif_code, 'Berufsunfähigkeit'  as tarif_name, 'UF' as tarif_kind
union all select 1030 as tarif_code, 'Erwerbsunfähigkeit' as tarif_name, 'UF' as tarif_kind
)

select *
from src