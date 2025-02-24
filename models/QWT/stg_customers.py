def model(dbt, session):
    
    customer_df = dbt.source('raw_qwt','CUSTOMERS')
 
    
    return customer_df 