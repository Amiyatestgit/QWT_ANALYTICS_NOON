


{{config(materialized='incremental',unique_key = ['OrderID','lineno'])}}
select od.*
from {{source('raw_qwt','ORDERS')}} o
inner join {{source ('raw_qwt','STG_ORDERDETAILS') }} od on od.OrderID = o.OrderID
{% if is_incremental() %}
 where o.OrderDate >= (select max(OrderDate) from {{source('raw_qwt','ORDERS')}})
{% endif %}