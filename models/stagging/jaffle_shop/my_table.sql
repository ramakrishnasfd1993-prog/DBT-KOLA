{{
    config(
        materialized='table',alias = 'my_alias_table',
        schema = 'my_schema'
    )
}}
with source_data as 
( select 1 as id 
union all 
select null as id )
select * from source_data