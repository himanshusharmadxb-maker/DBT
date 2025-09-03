with cte_w as (
    select
    TO_TIMESTAMP(time) as Started_at,
    DATE(TO_TIMESTAMP(time)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(time)) AS HOUR_STARTED_AT,
    CASE WHEN DAYNAME(TO_TIMESTAMP(time)) IN ('Sat','Sun') THEN 'WEEKEND' ELSE 'BUSINESSDAY' END AS DAY_CATEGORY,
    CASE WHEN MONTH(TO_TIMESTAMP(time)) IN (12,1,2) THEN 'WINTER'
         WHEN MONTH(TO_TIMESTAMP(time)) IN (5,3,4) THEN 'SPRING'
         WHEN MONTH(TO_TIMESTAMP(time)) IN (6,7,8) THEN 'SUMMER'
         ELSE 'AUTUMN'
    END AS STATION_OF_YEAR
    from {{ source('demo', 'weather') }}
)

select * from cte_w