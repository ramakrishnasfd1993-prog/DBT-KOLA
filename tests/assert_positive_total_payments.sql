select order_id, sum(amount) as total_amount
from {{ ref("stg_Payments") }}
group by 1
having not (total_amount >= 0)
