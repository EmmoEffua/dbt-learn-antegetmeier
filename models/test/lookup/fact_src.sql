with 
src as
(
          select '1234' as insurance_number, 'LV_Risiko'   as tarif_name, '0349' as ZWGST_NR, '20210312' as bearb_dat, 31.41 rate
union all select '4567' as insurance_number, 'LV_Standard' as tarif_name, '0349' as ZWGST_NR, '20210405' as bearb_dat, 27.18 rate
)

select *
from src