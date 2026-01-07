-- models/staging/stg_college.sql
{{
    config(
        materialized='view',tags = ["High"]
    )
}}
select
    college_name,  -- matches your DDL
    college_id
from {{ source('jaffle_shop', 'college') }}
