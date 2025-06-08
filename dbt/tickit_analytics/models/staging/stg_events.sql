{{ config(materialized='view') }}

select
    eventid,
    venueid,
    catid,
    dateid,
    eventname,
    starttime,
    -- 故意错误5: 错误的日期提取（应该提取小时，但提取了分钟）
    extract(minute from starttime) as event_hour
from {{ source('tickit', 'event') }}
