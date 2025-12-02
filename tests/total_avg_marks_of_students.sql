select * from {{ ref("student_pass_status") }} where pass_status = 'good'
