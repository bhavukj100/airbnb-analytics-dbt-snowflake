{{ config(materialized='ephemeral') }}

WITH listings AS
(
    SELECT 
    SILVER_LISTINGS_LISTING_ID AS LISTING_ID,
    LISTINGS_HOST_ID,
    PROPERTY_TYPE,
    CITY,
    COUNTRY,
    PRICE_PER_NIGHT_TAG,
    LISTING_CREATED_AT
    FROM
        {{ ref('obt') }}
)
SELECT * FROM listings