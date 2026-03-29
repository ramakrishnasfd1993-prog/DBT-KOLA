-- select * from {{ ref('snapshot_tickets_status') }}
-- where dbt_valid_to is null 

-- select
--   ticket_id,
--   ticket_status,
--   dbt_valid_from,
--   dbt_valid_to
-- from {{ ref('snapshot_tickets_status') }}

select ticket_id,
       ticket_status,
       updated_date,
       last_updated_at,
       LAST_UPDATED_AT_TS,
       dbt_valid_from,
       dbt_valid_to 
from {{ ref('snapshot_tickets_status') }}
order by ticket_id,dbt_valid_from