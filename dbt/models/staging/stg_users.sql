with source as (
    select * from {{ source('social_ads_raw', 'users') }}
),

renamed as (
    select
        user_id,
        user_gender as gender,
        user_age as age,
        age_group,
        country,
        location as state,
        interests
    from source
)

select * from renamed 