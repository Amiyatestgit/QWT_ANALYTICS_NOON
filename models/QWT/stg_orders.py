import snowflake.snowpark.functions as F
import pandas as pd

def model(dbt, session):
    dbt.config(materialized = "incremental", unique_key = ['orderid'])
    df = dbt.source('raw_qwt','ORDERS')
 
    if dbt.is_incremental:
        max_order_date = f"select max(orderdate) from {dbt.this}"
        df = df.filter(df.orderdate >= session.sql(max_order_date).collect()[0][0])
 
    return df