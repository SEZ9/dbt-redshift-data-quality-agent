{{ config(materialized='view') }}

select
    salesid,
    listid,
    sellerid,
    buyerid,
    eventid,
    dateid,
    qtysold,
    pricepaid,
    commission,
    -- 故意错误1: 计算错误的佣金率（应该是15%，但写成了20%）
    pricepaid * 0.20 as calculated_commission,
    saletime
from {{ source('tickit', 'sales') }}
-- 故意错误2: 缺少数据质量过滤，允许负价格
