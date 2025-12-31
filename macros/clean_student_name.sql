{% macro clean_student_name(student_name_col,student_id_col) %}
  case 
      when {{ student_name_col }} is null 
      or  trim ({{ student_name_col }}) = ''
      then concat('UNKNOWN_',{{ student_id_col }})
      else {{ student_name_col }}
  end
{% endmacro %}