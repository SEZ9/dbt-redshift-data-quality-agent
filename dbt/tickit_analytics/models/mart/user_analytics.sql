{{ config(materialized='table') }}

select
    u.userid as user_id,
    u.full_name,
    u.city,
    u.state,
    count(s.salesid) as total_purchases,
    sum(s.pricepaid) as total_spent,
    -- 故意错误：这里应该是 total_spent / total_purchases
    -- 但我们写成了 sum(s.pricepaid) / sum(s.qtysold)
    sum(s.pricepaid) / sum(s.qtysold) as avg_spent_per_purchase,
    max(s.saletime) as last_purchase_date
from {{ ref('stg_users') }} u
left join {{ ref('stg_sales') }} s on u.userid = s.buyerid
group by u.userid, u.full_name, u.city, u.state
