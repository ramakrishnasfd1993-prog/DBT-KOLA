{% snapshot snapshot_tickets_check %}
  {{
     config(
        target_schema = 'scd_type_2',
        strategy = 'check',
        unique_key = 'ticket_id',
        check_cols = ['ticket_status'],
        invalidate_hard_deletes = true
     )
  }}
  select * from {{ ref('tickets') }}
{%endsnapshot%}