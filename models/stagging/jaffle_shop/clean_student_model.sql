select 
   student_id,
   {{ clean_student_name('student_name','student_id')}} 
   as student_name,
      branch_name,
      pass_percentage,
      college_name
from {{ref('students')}}
