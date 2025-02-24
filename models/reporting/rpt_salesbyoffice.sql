{{config(materialized='view', schema = 'reporting_dev')}}

select 
e.country,
c.companyname,
c.contactname,
sum(o.orderid) as total_orders,
sum(o.quantity) as total_quantity,
avg(o.margin) as total_margin
from  {{ ref('dim_customers')}} as c
inner join {{ref('fct_orders')}} o on c.customerid = o.customerid
inner join {{ref('dim_employee')}} e on o.employeeid = e.empid
 where e.country = '{{var('v_counrty', 'France')}}'
group by e.country,
c.companyname,
c.contactname 
