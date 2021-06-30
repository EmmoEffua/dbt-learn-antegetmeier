{% snapshot dim_zweigstelle_snapshot2 %}

{{
    config(
      target_database='analytics',
      target_schema='DBT_ANTEGETMEIER',
      unique_key='zweigstelle_nummer',

      strategy='check',
      check_cols=['zweigstelle_name'],
    )
}}

select * from {{ ref('scd_src1') }}

{% endsnapshot %}