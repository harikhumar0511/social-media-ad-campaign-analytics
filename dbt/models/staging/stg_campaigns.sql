with source as (
    select * from {{ source('social_ads_raw', 'campaigns') }}
),

renamed as (
    select
        campaign_id,
        name as campaign_name,
        start_date,
        end_date,
        duration_days,
        total_budget as budget
    from source
)

select * from renamed