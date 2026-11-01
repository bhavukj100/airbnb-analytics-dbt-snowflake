{% set flag = 2 %}
{% set nights_booked = 3 %}

select *
from {{ ref("bronze_bookings") }}
{% if flag == 1 %} where nights_booked > {{ nights_booked }}
{% else %} where nights_booked = {{ nights_booked }}
{% endif %}
