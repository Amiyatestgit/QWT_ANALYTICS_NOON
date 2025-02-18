{{config(materialized='view', schema = 'sales_dev',
          post_hook = 'grant usage on database qwt_analytics_dev to role sysadmin;'
                      'grant usage on schema sales_dev to role sysadmin;'
         )}}
select *
from {{ ref('trf_orders') }}