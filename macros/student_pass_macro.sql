{% macro pass_fail_status(percentage_col) %}
   case 
      when {{ percentage_col }} >= 60 then 'pass'
      else 'fail'
   end
{% endmacro %}