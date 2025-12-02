-- models/staging/stg_college.sql
select
    collge_name,  -- matches your DDL
    college_id
from {{ source('jaffle_shop', 'college') }}
