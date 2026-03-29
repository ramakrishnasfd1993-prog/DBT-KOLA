{% snapshot snapshot_tickets_status %}

    {{
        config(
            target_schema="scd_type_2",
            strategy="check",
            unique_key="ticket_id",
            check_cols=["ticket_status","LAST_UPDATED_AT_TS"],
            invalidate_hard_deletes=true,
        )
    }}

    select *
    from {{ ref("tickets") }}
{% endsnapshot %}

