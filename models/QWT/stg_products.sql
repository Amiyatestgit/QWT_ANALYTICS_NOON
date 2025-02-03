{{ config(materialised = 'table')}}
 
select *
from
{{ source('raw_qwt','PRODUCTS')}}