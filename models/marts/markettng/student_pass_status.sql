select
    student_id,
    student_name,
    branch_name,
    pass_percentage,
    case when pass_percentage >= 35 then 'Pass' else 'Fail' end as pass_status
from {{ ref("students") }}
