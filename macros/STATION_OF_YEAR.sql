{% macro station_of_year(x) %}

CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2) THEN 'WINTER'
         WHEN MONTH(TO_TIMESTAMP({{x}})) IN (5,3,4) THEN 'SPRING'
         WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8) THEN 'SUMMER'
         ELSE 'AUTUMN'
    END

{% endmacro %}

{%macro day_type(x) %}

CASE WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun') THEN 'WEEKEND' ELSE 'BUSINESSDAY' END 

{% endmacro %}