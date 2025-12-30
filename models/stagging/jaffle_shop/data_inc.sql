{{ config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'D_DATE'
) }}

select *
from raw.jaffle_shop.incremental_table

{% if is_incremental() %}
where D_DATE >= (
    select dateadd(day, -7, max(D_DATE))
    from {{ this }}
)
{% endif %}
