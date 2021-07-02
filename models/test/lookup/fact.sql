{{ config(
    materialized="table"
) }}


with
src as 
(
select * from {{ ref('fact_src') }}
)
, dzw as
(
    select dbt_scd_id as zwgst_id, zweigstelle_nummer as zwgst_nr, dbt_valid_from as valid_from, dbt_valid_to as valid_to from {{ ref('dim_zweigstelle_snapshot1') }}
)
, dta as
(
    select tarif_code, tarif_name from {{ ref('tarif_src') }} 
)
, dpa as
(
    select insurance_number, customer_name_vp, customer_name_vn, customer_name_za from {{ ref('pivot_tst') }}
)

select 
      insurance_number
    , (select nvl(max(dzw.zwgst_id), '-1') from dzw where dzw.zwgst_nr = src.zwgst_nr and to_date(src.bearb_dat, 'YYYYMMDD') between valid_from and dateadd(DAY, -1, valid_to)) as zwgst_id
    , (select nvl(max(dta.tarif_code), '-1') from dta where dta.tarif_name = src.tarif_name ) tarif_id
    , (select nvl(max(dpa.customer_name_vp), '') from dpa where dpa.insurance_number = src.insurance_number) partner_vp_name 
    , (select nvl(max(dpa.customer_name_vn), '') from dpa where dpa.insurance_number = src.insurance_number) partner_vn_name 
    , (select nvl(max(dpa.customer_name_za), '') from dpa where dpa.insurance_number = src.insurance_number) partner_za_name 
    , to_date(bearb_dat, 'YYYYMMDD') bearbeitungsdatum
    , rate
from src
