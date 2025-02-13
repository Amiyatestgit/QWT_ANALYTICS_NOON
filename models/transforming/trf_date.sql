{{config(materialized='table', schema= 'transforming_dev')}}

{% set v_min_date = min_date() %}
{% set v_max_date = max_date() %}

{{ dbt_date.get_date_dimension(v_min_date, v_max_date) }}
