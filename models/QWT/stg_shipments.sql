{{config(materialized='table')}}
select
OrderID,
LineNo,
ShipperID,
CustomerID,
ProductID,
EmployeeID,
to_date(SUBSTR(ShipmentDate,1,regexp_instr(ShipmentDate,' ',1,1)-1)) AS ShipmentDate,
Status
from {{source('raw_qwt','SHIPMENTS')}}