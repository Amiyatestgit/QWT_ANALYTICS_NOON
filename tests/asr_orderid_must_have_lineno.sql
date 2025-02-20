select orderid,lineno as lineno,count(*)
from
{{ref('fct_orders')}}
group by orderid,lineno
having count(*)<1
