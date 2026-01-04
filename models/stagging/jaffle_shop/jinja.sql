{# 
{% set my_string  = 'kola Ramakrishna' %}
{% set my_string2 = 'Gayathri' %}
{% set my_string3 = 'yaajveth shanmukh' %}
select '{{ my_string }} {{ my_string2 }} and {{ my_string3 }}' as message}
#}

{# {% set my_str = ['Ramakrishna','Gauathri','Yaajveth'] %}
select 
 {% for member in my_str %}
 'my family member is {{ member }}'
 {% if not loop.last %} || chr(10) || {% endif %}
{% endfor %}  
 #} 

-- {%- set temperature = var('temperature',25) %}
-- {%- if temperature > 45 %} 
-- very humid 
-- {%- elif temperature > 30 %} 
-- moderate 
-- {%- elif temperature > 20 %} 
-- cool
-- {%- else %} 
-- very cool
-- {% endif %} 

WITH PAYMENTS AS ( SELECT * FROM {{ ref('stg_Payments') }} ),

FINAL AS (
    SELECT ORDER_ID,
    {% set PAYMENT_METHODES = ['bank_transfer','credit_card','coupon','gift card'] %}
    {% for PAYMENT_METHODE in PAYMENT_METHODE %}

    sum(case when PAYMENT_METHODE = {{ PAYMENT_METHODE }} then amount else 0 end)
    as {{PAYMENT_METHODE}}_amont
    {% endfor %}

    from PAYMENTS
    group by 1
)
select * from FINAL
