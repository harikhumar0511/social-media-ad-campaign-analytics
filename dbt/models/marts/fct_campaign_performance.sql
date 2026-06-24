with events as (
    select * from {{ ref('stg_ad_events') }}
),

ads as (
    select * from {{ ref('stg_ads') }}
),

campaigns as (
    select * from {{ ref('stg_campaigns') }}
),

users as (
    select * from {{ ref('stg_users') }}
),

joined as (
    select
        e.event_id,
        e.event_type,
        e.event_date,
        e.event_timestamp,
        e.day_of_week,
        e.time_of_day,
        a.ad_id,
        a.ad_platform,
        a.ad_type,
        a.target_gender,
        a.target_age_group,
        a.target_interests,
        c.campaign_id,
        c.campaign_name,
        c.start_date,
        c.end_date,
        c.budget,
        c.duration_days,
        u.user_id,
        u.age,
        u.gender,
        u.state,
        u.interests,
        case
            when e.event_date < '2025-02-13' then 'Pre-campaign'
            when e.event_date between '2025-02-13' and '2025-04-13' then '2 months in'
            when e.event_date between '2025-04-14' and '2025-06-13' then '4 months in'
            else 'Full campaign'
        end as campaign_phase
    from events e
    left join ads a on e.ad_id = a.ad_id
    left join campaigns c on a.campaign_id = c.campaign_id
    left join users u on e.user_id = u.user_id
)
  
select * from joined 