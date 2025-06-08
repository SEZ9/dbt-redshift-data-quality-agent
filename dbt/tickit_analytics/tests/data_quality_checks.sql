-- 检查是否有负价格的销售记录
select *
from {{ ref('fact_sales') }}
where price_paid < 0
