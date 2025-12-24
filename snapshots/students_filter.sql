{%snapshot students_validation_check%}
{{
    config(
        target_schema = 'scd_type_2',
        strategy = 'check',
        unique_key = 'student_id',
        check_cols = ['student_name','branch_name','pass_percentage','college_name'],
        invalidate_hard_deletes = true
    )
}}

select * from {{ ref('students') }}
{%endsnapshot%}