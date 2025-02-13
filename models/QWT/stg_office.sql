{{config(materialized = 'table')}}
 
select
Office,
OfficeAddress AS Address,
OfficePostalCode AS PostalCode,
OfficeCity  AS City,
OfficeStateProvince AS StateProvince,
OfficePhone AS Phone,
OfficeFax AS Fax,
OfficeCountry AS Country 
from {{source('raw_qwt','OFFICE')}}