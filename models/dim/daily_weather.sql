with
    daily_weather as (

        select date(time) as daily_weather, weather, pressure, humidity, clouds
        from {{ source("demo", "weather") }}
        limit 10
    ),
    daily_weather_agg as (
        select
            daily_weather,
            weather,
            count(weather) as cnt,
            round(avg(pressure), 2) as avg_pressure,
            avg(humidity) as avg_humidity,
            avg(clouds) as avg_clouds
        from daily_weather
        group by daily_weather, weather
    ),
    window_func as (
        select
            daily_weather,
            weather,
            avg_pressure,
            avg_humidity,
            avg_clouds,
            row_number() over (partition by daily_weather order by cnt desc) as rn
        from daily_weather_agg
    )

select *
from window_func
where rn = 1
