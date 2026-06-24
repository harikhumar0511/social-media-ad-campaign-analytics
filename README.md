# Social Media Ad Campaign Performance Dashboard

An end-to-end data analytics project analyzing 400K+ social media ad events across platforms, audience segments, and campaign phases.

## Live Dashboard
[View on Tableau Public](https://public.tableau.com/app/profile/harikhumar.prabhakaran/viz/SocialMediaAdCampaignPerformanceDashboard/Dashboard1)

## Tech Stack
- **BigQuery** — cloud data warehouse (project: `social-ads-analytics`)
- **dbt Cloud** — data modeling and transformation
- **Google Colab** — data ingestion and BigQuery loading
- **Tableau Public** — interactive dashboard

## Dataset
Social Media Advertisement Performance — Kaggle  
403,967 rows across 4 tables: users, campaigns, ads, ad_events

## Project Architecture
Raw Data (BigQuery) → dbt Staging Models → Fact Table → Tableau Dashboard

## dbt Models
**Staging**
- `stg_users` — cleaned user demographics
- `stg_campaigns` — campaign metadata
- `stg_ads` — ad format and budget
- `stg_ad_events` — impression, click, purchase events

**Marts**
- `fct_campaign_performance` — joined fact table with campaign phase classification

## Dashboard Features
- KPIs: Impressions, Clicks, Purchases, CTR
- Engagement Heatmap by Day & Time
- CTR vs Purchase Rate by Campaign Phase
- Conversion Rate by Ad Format
- Conversion Rate by Age Group
- Filters: Gender, Age Group, Ad Platform, Campaign Phase
