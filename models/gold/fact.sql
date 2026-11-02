{#
1. Which table do I want to read
This is decided by the first configuration.
2. There can be multiple changes in this pipeline.
3. This concept is called metdata-driven pipeline. 
In interviews, this can be asked in following way: write a dynamic ELT query.
4. Basically it can be simple, comnplex, nested, hierarichal and can have many levels to it.
#} 
{% set configs = [
    {
        "table": "AIRBNB.GOLD.OBT",
        "columns":"gold_obt.booking_id, gold_obt.silver_listings_listing_id as listing_id, gold_obt.silver_hosts_host_id as host_id, gold_obt.total_amount, gold_obt.service_fee, gold_obt.cleaning_fee, gold_obt.accommodates, gold_obt.bedrooms, gold_obt.bathrooms, gold_obt.price_per_night, gold_obt.response_rate",
        "alias": "gold_obt"
    },
    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns": "",
        "alias": "gold_dim_listings",
        "join_conditions": "gold_obt.silver_listings_listing_id = gold_dim_listings.LISTING_ID",
    },
    {
        "table":"AIRBNB.GOLD.DIM_HOSTS",
        "columns":"",
        "alias":"gold_dim_hosts",
        "join_conditions":"gold_obt.silver_hosts_host_id = gold_dim_hosts.host_id",
    }
]%}

SELECT
        {{ configs[0]['columns'] }}
FROM
   {% for config in configs %}
       {% if loop.first %}
           {{ config['table']}} AS {{ config['alias'] }}
       {% else %}
           LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
           ON {{ config['join_conditions'] }}
       {% endif %}
   {% endfor %}