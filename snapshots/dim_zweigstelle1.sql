{% snapshot dim_zweigstelle_snapshot1 %}

{{
    config(
      target_database='analytics',
      target_schema='DBT_ANTEGETMEIER',
      unique_key='zweigstelle_nummer',

      strategy='timestamp',
      updated_at='bearbeitungsdatum',
    )
}}

select * from {{ ref('scd_src1') }}

{% endsnapshot %}