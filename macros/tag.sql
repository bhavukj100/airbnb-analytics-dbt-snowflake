{% macro tag(column_name) %}
    CASE 
    WHEN PRICE_PER_NIGHT < 100 THEN 'Low'
    WHEN PRICE_PER_NIGHT >= 100 and PRICE_PER_NIGHT < 200 THEN 'Medium'
    ELSE 'High'
    END
{% endmacro %}