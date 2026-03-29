{{ config(materialized="table") }}

select
    ticket_id,
    ticket_status,
    updated_date,
    last_updated_at,
    LAST_UPDATED_AT_TS
from RAW.PRACTICE_RAW.TICKETS
