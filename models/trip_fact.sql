with trips as (

    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    date(to_timestamp(started_at)) as trip_date,
    START_STATIO_ID as start_station_id, 
    end_station_id, 
    MEMBER_CSUAL as member_casual,
    timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_seconds

    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'

)

select * from trips