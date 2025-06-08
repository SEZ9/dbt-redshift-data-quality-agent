{{ config(materialized='view') }}

select
    userid,
    username,
    firstname,
    lastname,
    -- 故意错误3: 拼接名字时缺少空格处理
    firstname || lastname as full_name,
    city,
    state,
    email,
    phone,
    case when likesports = 't' then true else false end as likes_sports,
    case when liketheatre = 't' then true else false end as likes_theatre
from {{ source('tickit', 'users') }}
-- 故意错误4: 没有过滤无效的email格式
