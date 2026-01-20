{% snapshot students_sk %}

{{
    config(
        target_schema   = 'DBT_KKOLA',   
        unique_key      = 'STUDENT_ID',
        strategy        = 'timestamp',
        updated_at      = 'UPDATED_AT'
    )
}}

SELECT
    STUDENT_ID,
    STUDENT_NAME,
    BRANCH_NAME,
    PASS_PERCENTAGE,
    COLLEGE_NAME,
    UPDATED_AT
FROM {{ source('jaffle_shop', 'students') }}

{% endsnapshot %}
