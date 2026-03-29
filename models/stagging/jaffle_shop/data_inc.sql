{{
    config(
        materialized='incremental',
        incremental_strategy = 'merge',
        unique_key = 'ticket_id'
    )
}}

select ticket_id,
       ticket_status,
       last_updated_at,
       last_updated_at_ts
from {{ source('jaffle_shop', 'tickets') }}

{% if is_incremental() %}
where last_updated_at >= (
    select dateadd(day,-7,max(last_updated_at))
    from {{ this }}
)

{% endif %}