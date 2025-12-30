{{
    config(
        materialized='incremental',
        incremental_strategy = 'merge',
        unique_key = 'STUDENT_ID'
    )
}}

select * from RAW.PRACTICE_RAW.STUDENTS

{% if is_incremental() %}
where updated_at > (
    select coalesce(max(updated_at), '1900-01-01')
    from {{ this }}
)
{% endif %}
