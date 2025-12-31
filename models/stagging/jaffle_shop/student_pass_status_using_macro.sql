select 
 student_id,
 {{ clean_student_name('student_name','student_id')}} as student_name,
 pass_percentage,
 {{ pass_fail_status('pass_percentage') }} as student_result
 from {{ ref('students') }}