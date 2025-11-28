-- models/marts/dim_students.sql
with
    students as (select * from {{ ref("students") }}),

    branches as (select * from {{ ref("branch") }}),

    colleges as (select * from {{ ref("college") }}),

    student_enriched as (

        select
            s.student_id,
            s.student_name,
            s.branch_name as branch_code,  -- use whatever column exists in your students model
            b.branch_name as branch_fullname,
            s.college_name,
            c.collge_name as collge_name,  -- kept the typo to match your raw table
            c.college_id,
            s.pass_percentage
        from students s
        left join branches b on upper(trim(s.branch_name)) = upper(trim(b.branch_id))
        left join colleges c on upper(trim(s.college_name)) = upper(trim(c.collge_name))

    )

select *
from student_enriched
