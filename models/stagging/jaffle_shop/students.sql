-- models/staging/stg_students.sql
select
    student_id,
    student_name,
    branch_name , 
    pass_percentage,
    college_name
from raw.practice_raw.students
