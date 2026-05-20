WITH CTE AS (

SELECT
    TO_TIMESTAMP(started_at) AS STARTED_AT,
    
    DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
    
    HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,

    -- DAYOFWEEK(TO_TIMESTAMP(started_at)) AS DAY_OF_WEEK,

    DAYNAME(TO_TIMESTAMP(started_at)) AS DAY_NAME,

    CASE
        WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat','Sun')
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS DAY_TYPE,

    MONTH(TO_TIMESTAMP(started_at)) AS MONTH_NUM,

    CASE
        WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3,4,5,6)
        THEN 'Summer'
        ELSE 'Non Summer'
    END AS SEASON

FROM {{ source('demo', 'bike') }}

)

SELECT *
FROM CTE