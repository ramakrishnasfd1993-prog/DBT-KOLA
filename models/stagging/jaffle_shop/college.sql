-- models/staging/stg_college.sql
select
    college_name,  -- matches your DDL
    college_id
from {{ source('jaffle_shop', 'college') }}
