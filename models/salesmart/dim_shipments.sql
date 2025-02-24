{{config(materialized='view', schema = 'sales_dev')}}
select 
orderid,
lineno,
companyname,
SHIPMENTDATE,
curentstatus
from {{ ref('trf_shipments') }}