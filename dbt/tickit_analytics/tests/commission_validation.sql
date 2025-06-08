-- 检查佣金计算是否正确（应该是15%）
select *
from {{ ref('fact_sales') }}
where abs(commission - (price_paid * 0.15)) > 0.01  -- 修改：pricepaid -> price_paid
