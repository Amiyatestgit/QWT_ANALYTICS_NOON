{{config(materialized='table', schema=  env_var('DBT_TRANSFORMSCHEMA', 'transforming_dev'))}}
select 
get(xmlget(CONTACTSINFO,'SupplierID'),'$') as SupplierID
,get(xmlget(CONTACTSINFO,'CompanyName'),'$')::varchar as CompanyName
,get(xmlget(CONTACTSINFO,'ContactName'),'$')::varchar as ContactName
,get(xmlget(CONTACTSINFO,'Address'),'$')::varchar as Address
,get(xmlget(CONTACTSINFO,'City'),'$')::varchar as  City
,get(xmlget(CONTACTSINFO,'PostalCode'),'$')::varchar as PostalCode
,get(xmlget(CONTACTSINFO,'Country'),'$')::varchar as Country
,get(xmlget(CONTACTSINFO,'Phone'),'$')::varchar as Phone
,get(xmlget(CONTACTSINFO,'Fax'),'$')::varchar as Fax
from {{ ref('stg_suppliers')}}