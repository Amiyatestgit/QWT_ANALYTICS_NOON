{{config(materialized='view', schema = 'sales_dev')}}
select *
from {{ ref('trf_date') }}