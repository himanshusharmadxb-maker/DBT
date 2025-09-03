with
    cte_w as (
        select
            to_timestamp(time) as started_at,
            date(to_timestamp(time)) as date_started_at,
            hour(to_timestamp(time)) as hour_started_at,
            {{ day_type("time") }} as day_category,
            {{ station_of_year("time") }} as station_of_year,
            {{ function1("time") }} as macros

        from {{ source("demo", "weather") }}
    )

select *
from cte_w
