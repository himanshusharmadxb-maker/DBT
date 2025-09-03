with cte_w as (
    select
    TO_TIMESTAMP(time) as Started_at,
    DATE(TO_TIMESTAMP(time)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(time)) AS HOUR_STARTED_AT,
    {{day_type('time')}}AS DAY_CATEGORY,
    {{station_of_year('time')}} as STATION_OF_YEAR,
    {{function1('time')}} AS MACROS

    from {{ source('demo', 'weather') }}
)

select * from cte_w


