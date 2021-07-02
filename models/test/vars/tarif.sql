select * 
from {{ ref('tarif_src') }}
where tarif_kind = '{{ var('tarif_kind')}}'