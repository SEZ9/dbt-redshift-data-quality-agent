{{ config(materialized='table') }}

select
    s.salesid as sale_id,
    s.sellerid as seller_id,
    s.buyerid as buyer_id,
    s.eventid as event_id,
    s.qtysold as quantity_sold,
    s.pricepaid as price_paid,
    s.commission,
    s.calculated_commission,
    -- 故意错误6: 计算单价时没有处理除零情况
    s.pricepaid / s.qtysold as price_per_ticket,
    e.eventname,
    u.full_name as buyer_name,
    -- 故意错误7: 错误的收入计算（应该减去佣金，但加了佣金）
    s.pricepaid + s.commission as net_revenue
from {{ ref('stg_sales') }} s
left join {{ ref('stg_events') }} e on s.eventid = e.eventid
left join {{ ref('stg_users') }} u on s.buyerid = u.userid
