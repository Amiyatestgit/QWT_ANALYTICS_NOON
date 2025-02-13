{{config(materialized='view', schema = 'reporting_dev')}}
{% set v_linenos = get_order_linenos() %}

select distinct
ORDERID,

{% for linenumber in v_linenos -%}

sum( case when lineno = {{linenumber}} then linesalesamount else 0 end) as lineno{{linenumber}}_sales,
{% endfor %}
sum(LINESALESAMOUNT) totalsales
from {{ ref('fct_orders') }}
group by OrderID
