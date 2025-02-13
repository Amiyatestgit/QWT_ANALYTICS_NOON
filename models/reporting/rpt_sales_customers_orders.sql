{{config(materialized='view',schema='reporting_dev')}}
with customers as (
    select
    CUSTOMERID,
    COMPANYNAME,
    CONTACTNAME
    from {{ ref('dim_customers') }}
),
orders as (
    select
    CUSTOMERID,
    day(min(ORDERDATE)) as firstorderday,
    min(ORDERDATE) as firstorderdate,
    max(ORDERDATE) as recentorderdate,
    count(LINESALESAMOUNT) as totalorders,
    sum(COSTOFGOODSSOLD) as total_sales
    from {{ ref('fct_orders') }}
    group by CUSTOMERID
),
final as (
    select
    c.COMPANYNAME,
    c.CONTACTNAME,
    o.firstorderdate,
    o.firstorderday,
    o.recentorderdate,
    o.totalorders,
    o.total_sales
    from customers c
     inner join orders o
     on c.CUSTOMERID = o.customerid
 
)
select * from final