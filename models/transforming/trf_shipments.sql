{{config(materialized='table',schema= 'transforming_dev') }}
select
ss.orderid,
ss.lineno,
s.companyname as shipmentcompany,
ss.ShipmentDate,
ss.status
from
{{ ref('shipments_snapshot') }} as ss
inner join
{{ ref('shipers') }} as s
on ss.shipperid = s.shipperid
where ss.dbt_valid_to is null