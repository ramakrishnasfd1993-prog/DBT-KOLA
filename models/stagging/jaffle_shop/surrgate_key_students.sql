{{
    config(
        materialized='table'
    )
}}
select 
{{ dbt_utils.generate_surrogate_key(['STUDENT_ID','DBT_VALID_FROM'])}} AS SURR_KEY_STUDENTS,
STUDENT_ID, 
STUDENT_NAME, 
BRANCH_NAME, 
PASS_PERCENTAGE, 
COLLEGE_NAME, 
UPDATED_AT, 
DBT_SCD_ID, 
DBT_UPDATED_AT, 
DBT_VALID_FROM, 
DBT_VALID_TO,

CASE 
   WHEN DBT_VALID_TO IS NULL THEN TRUE
   ELSE FALSE 
   END AS IS_CURRENT 
   
FROM {{ ref('students_sk') }}