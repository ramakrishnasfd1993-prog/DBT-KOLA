with
    studentcount as (
        select
            college_name,
            count(*) as student_cont,
            avg(pass_percentage) as overall_pass_percentage_collge_wise

        from {{ ref("students") }}
        group by college_name
    )
select *
from studentcount
