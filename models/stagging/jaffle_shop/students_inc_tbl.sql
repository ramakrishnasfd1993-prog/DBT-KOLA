{{
    config(
        materialized='incremental',
        incremental_strategy = 'merge',
        unique_key = 'STUDENT_ID'
    )
}}

select
    STUDENT_ID,
    STUDENT_NAME,
    BRANCH_NAME,
    PASS_PERCENTAGE,
    COLLEGE_NAME,
    UPDATED_AT
from RAW.PRACTICE_RAW.STUDENTS
