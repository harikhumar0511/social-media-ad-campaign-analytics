with source as (
    select * from {{ source('social_ads_raw', 'ad_events') }}
),

renamed as (
    select
        event_id,
        ad_id,
        user_id,
        timestamp as event_timestamp,
        date(timestamp) as event_date,
        day_of_week,
        time_of_day,
        event_type
    from source 
)

select * from renamed