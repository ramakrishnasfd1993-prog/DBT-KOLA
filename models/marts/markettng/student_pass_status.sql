select
    student_id,
    student_name,
    branch_name,
    pass_percentage,
    case 
    when pass_percentage >= 80 then 'excellent' 
    when pass_percentage >= 60 then 'good'
    when pass_percentage >= 40 then 'pass'
    else 'Fail' end as pass_status
from {{ ref("students") }}
