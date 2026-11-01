{{ config(materialized='incremental', unique_key='host_id' ) }}

SELECT
    host_id,
    REPLACE(host_name,' ','_') AS host_name,
    host_since as host_since,
    is_superhost as is_superhost,
    response_rate as response_rate,
    CASE 
        WHEN response_rate >=95 THEN 'VERY GOOD'
        WHEN response_rate < 95 AND response_rate >= 80 THEN 'GOOD'
        WHEN response_rate < 80 AND response_rate >= 60 THEN 'OK'
        ELSE 'POOR'
    END as response_rate_quality,
    created_at as created_at
FROM {{ ref('bronze_hosts') }}