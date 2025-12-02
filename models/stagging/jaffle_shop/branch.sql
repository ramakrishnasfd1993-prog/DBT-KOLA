-- models/staging/stg_branch.sql
select branch_name, branch_id 
from {{ source('jaffle_shop', 'branch') }}
